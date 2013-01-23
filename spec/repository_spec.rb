require 'spec_helper'
require 'helpers/repositories'

require 'ronin/repository'

describe Repository do
  include Helpers::Repositories

  subject { described_class }

  describe "find" do
    it "should be able to retrieve an Repository by name" do
      repo = subject.find('local')

      repo.name.should == 'local'
    end

    it "should be able to retrieve an Repository by name and domain" do
      repo = subject.find('installed@github.com')

      repo.name.should == 'installed'
      repo.domain.should == 'github.com'
    end

    it "should raise RepositoryNotFound for unknown Repository names" do
      lambda {
        subject.find('bla')
      }.should raise_error(RepositoryNotFound)
    end

    it "should raise RepositoryNotFound for unknown Repository names or domains" do
      lambda {
        subject.find('bla/bla')
      }.should raise_error(RepositoryNotFound)
    end
  end

  describe "add" do
    it "should not add Repositorys without a path property" do
      lambda {
        subject.add
      }.should raise_error(ArgumentError)
    end

    it "should not add Repositorys that do not point to a directory" do
      lambda {
        subject.add(path: 'path/to/nowhere')
      }.should raise_error(RepositoryNotFound)
    end

    it "should not allow adding an Repository from the same path twice" do
      lambda {
        subject.add(path: repository('local').path)
      }.should raise_error(DuplicateRepository)
    end

    it "should not allow adding an Repository that was already installed" do
      lambda {
        subject.add(path: repository('installed').path)
      }.should raise_error(DuplicateRepository)
    end
  end

  describe "install" do
    it "should not allow installing an Repository with no URI" do
      lambda {
        subject.install
      }.should raise_error(ArgumentError)
    end

    it "should not allow installing an Repository that was already added" do
      lambda {
        subject.install(uri: repository('remote').uri)
      }.should raise_error(DuplicateRepository)
    end

    it "should not allow installing an Repository from the same URI twice" do
      lambda {
        subject.install(uri: repository('installed').uri)
      }.should raise_error(DuplicateRepository)
    end
  end

  describe "#domain" do
    it "should be considered local for 'localhost' domains" do
      repo = repository('local')

      repo.should be_local
      repo.should_not be_remote
    end

    it "should be considered remote for non 'localhost' domains" do
      repo = repository('installed')

      repo.should be_remote
      repo.should_not be_local
    end
  end

  describe "#initialize" do
    it "should default the 'name' property to the name of the Repository directory" do
      repo = subject.new(
        path: File.join(Helpers::Repositories::DIR,'local')
      )

      repo.name.should == 'local'
    end

    it "should default the 'installed' property to false" do
      repo = subject.new(
        path: File.join(Helpers::Repositories::DIR,'local'),
        uri: 'git://github.com/path/to/local.git'
      )

      repo.installed.should == false
    end
  end

  describe "#initialize_metadata" do
    subject { repository('installed') }

    it "should load the title" do
      subject.title.should == 'Installed Repo'
    end

    it "should load the website" do
      website = Addressable::URI.parse('http://ronin.rubyforge.org/')

      subject.website.should == website
    end

    it "should load the license" do
      subject.license.should_not be_nil
      subject.license.name.should == 'GPL-2'
    end

    it "should load the maintainers" do
      author = subject.authors.find { |author|
        author.name == 'Postmodern' &&
        author.email == 'postmodern.mod3@gmail.com'
      }
      
      author.should_not be_nil
    end

    it "should load the description" do
      subject.description.should == %{This is a test repo used in Ronin's specs.}
    end
  end

  describe "#activate!" do
    subject { repository('local') }

    before(:all) do
      subject.activate!
    end

    it "should load the init.rb file if present" do
      $local_repo_loaded.should == true
    end

    it "should make the lib directory accessible to Kernel#require" do
      require('stuff/test').should == true
    end
  end

  describe "#deactivate!" do
    subject { repository('local') }

    before(:all) do
      subject.deactivate!
    end

    it "should make the lib directory unaccessible to Kernel#require" do
      lambda {
        require 'stuff/another_test'
      }.should raise_error(LoadError)
    end
  end

  describe "#each_script" do
    subject { repository('scripts') }

    it "should list the contents of the 'cache/' directory" do
      subject.each_script.to_a.should_not be_empty
    end

    it "should only list '.rb' files" do
      subject.each_script.map { |path|
        path.extname
      }.uniq.should == ['.rb']
    end
  end

  describe "#script_paths" do
    subject { repository('scripts') }

    describe "#cache_scripts!" do
      before(:all) { subject.cache_scripts! }

      it "should be populated script_paths" do
        subject.script_paths.should_not be_empty
      end

      it "should recover from files that contain syntax errors" do
        subject.find_script('failures/syntax_errors.rb').should_not be_nil
      end

      it "should recover from files that raised exceptions" do
        subject.find_script('failures/exceptions.rb').should_not be_nil
      end

      it "should recover from files that raise NoMethodError" do
        subject.find_script('failures/no_method_errors.rb').should_not be_nil
      end

      it "should recover from files that have validation errors" do
        subject.find_script('failures/validation_errors.rb').should_not be_nil
      end

      it "should clear script_paths before re-populate them" do
        paths = subject.script_paths.length
        subject.cache_scripts!

        subject.script_paths.length.should == paths
      end

      it "should be populated using the paths in the 'cache/' directory" do
        subject.script_paths.map { |file|
          file.path
        }.should == subject.each_script.to_a
      end
    end

    describe "#sync_scripts!" do
      before(:all) do
        subject.cache_scripts!

        script_path = subject.find_script('cached/modified.rb')

        script_path.timestamp -= 10
        script_path.save

        script_path = subject.find_script('cached/cached.rb')
        script_path.destroy!

        subject.sync_scripts!
      end

      it "should update stale cached files" do
        script_path = subject.find_script('cached/modified.rb')

        script_path.timestamp.should == File.mtime(script_path.path)
      end

      it "should cache new files" do
        subject.find_script('cached/cached.rb').should_not be_nil
      end
    end

    describe "#clean_scripts!" do
      before(:all) do
        subject.clean_scripts!
      end

      it "should clear the script_paths" do
        subject.script_paths.should be_empty
      end
    end
  end
end
