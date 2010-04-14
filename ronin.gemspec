# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{ronin}
  s.version = "0.4.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Postmodern"]
  s.date = %q{2010-04-13}
  s.description = %q{Ronin is a Ruby platform for exploit development and security research. Ronin allows for the rapid development and distribution of code, exploits or payloads over many common Source-Code-Management (SCM) systems.}
  s.email = %q{postmodern.mod3@gmail.com}
  s.executables = ["ronin-console", "ronin-update", "ronin-uninstall", "ronin-add", "ronin", "ronin-list", "ronin-install", "ronin-database", "ronin-help"]
  s.extra_rdoc_files = [
    "ChangeLog.md",
     "README.md"
  ]
  s.files = [
    ".gitignore",
     ".specopts",
     ".yardopts",
     "COPYING.txt",
     "ChangeLog.md",
     "README.md",
     "Rakefile",
     "bin/ronin",
     "bin/ronin-add",
     "bin/ronin-console",
     "bin/ronin-database",
     "bin/ronin-help",
     "bin/ronin-install",
     "bin/ronin-list",
     "bin/ronin-uninstall",
     "bin/ronin-update",
     "data/ronin/platform/overlay.xsl",
     "lib/ronin.rb",
     "lib/ronin/arch.rb",
     "lib/ronin/author.rb",
     "lib/ronin/config.rb",
     "lib/ronin/database.rb",
     "lib/ronin/database/database.rb",
     "lib/ronin/database/exceptions.rb",
     "lib/ronin/database/exceptions/invalid_config.rb",
     "lib/ronin/database/exceptions/unknown_repository.rb",
     "lib/ronin/environment.rb",
     "lib/ronin/installation.rb",
     "lib/ronin/license.rb",
     "lib/ronin/model.rb",
     "lib/ronin/model/has_authors.rb",
     "lib/ronin/model/has_description.rb",
     "lib/ronin/model/has_license.rb",
     "lib/ronin/model/has_name.rb",
     "lib/ronin/model/has_version.rb",
     "lib/ronin/model/lazy_upgrade.rb",
     "lib/ronin/model/model.rb",
     "lib/ronin/os.rb",
     "lib/ronin/platform.rb",
     "lib/ronin/platform/cacheable.rb",
     "lib/ronin/platform/cached_file.rb",
     "lib/ronin/platform/config.rb",
     "lib/ronin/platform/exceptions.rb",
     "lib/ronin/platform/exceptions/duplicate_overlay.rb",
     "lib/ronin/platform/exceptions/extension_not_found.rb",
     "lib/ronin/platform/exceptions/overlay_not_found.rb",
     "lib/ronin/platform/extension.rb",
     "lib/ronin/platform/extension_cache.rb",
     "lib/ronin/platform/maintainer.rb",
     "lib/ronin/platform/overlay.rb",
     "lib/ronin/platform/overlay_cache.rb",
     "lib/ronin/platform/overlays.rb",
     "lib/ronin/platform/platform.rb",
     "lib/ronin/rpc.rb",
     "lib/ronin/rpc/call.rb",
     "lib/ronin/rpc/client.rb",
     "lib/ronin/rpc/console.rb",
     "lib/ronin/rpc/exceptions.rb",
     "lib/ronin/rpc/exceptions/not_implemented.rb",
     "lib/ronin/rpc/exceptions/response_missing.rb",
     "lib/ronin/rpc/response.rb",
     "lib/ronin/rpc/service.rb",
     "lib/ronin/rpc/shell.rb",
     "lib/ronin/ui.rb",
     "lib/ronin/ui/command_line.rb",
     "lib/ronin/ui/command_line/command.rb",
     "lib/ronin/ui/command_line/command_line.rb",
     "lib/ronin/ui/command_line/commands.rb",
     "lib/ronin/ui/command_line/commands/add.rb",
     "lib/ronin/ui/command_line/commands/console.rb",
     "lib/ronin/ui/command_line/commands/database.rb",
     "lib/ronin/ui/command_line/commands/help.rb",
     "lib/ronin/ui/command_line/commands/install.rb",
     "lib/ronin/ui/command_line/commands/list.rb",
     "lib/ronin/ui/command_line/commands/uninstall.rb",
     "lib/ronin/ui/command_line/commands/update.rb",
     "lib/ronin/ui/command_line/exceptions.rb",
     "lib/ronin/ui/command_line/exceptions/unknown_command.rb",
     "lib/ronin/ui/console.rb",
     "lib/ronin/ui/hexdump.rb",
     "lib/ronin/ui/hexdump/extensions.rb",
     "lib/ronin/ui/hexdump/extensions/file.rb",
     "lib/ronin/ui/hexdump/extensions/kernel.rb",
     "lib/ronin/ui/hexdump/hexdump.rb",
     "lib/ronin/ui/output.rb",
     "lib/ronin/ui/output/handler.rb",
     "lib/ronin/ui/output/helpers.rb",
     "lib/ronin/ui/output/output.rb",
     "lib/ronin/ui/shell.rb",
     "lib/ronin/version.rb",
     "ronin.gemspec",
     "spec/arch_spec.rb",
     "spec/author_spec.rb",
     "spec/database_spec.rb",
     "spec/helpers/database.rb",
     "spec/installation_spec.rb",
     "spec/license_spec.rb",
     "spec/model/has_description_spec.rb",
     "spec/model/has_license_spec.rb",
     "spec/model/has_name_spec.rb",
     "spec/model/lazy_upgrade_spec.rb",
     "spec/model/model_spec.rb",
     "spec/model/models/basic_model.rb",
     "spec/model/models/custom_model.rb",
     "spec/model/models/described_model.rb",
     "spec/model/models/lazy_model.rb",
     "spec/model/models/licensed_model.rb",
     "spec/model/models/named_model.rb",
     "spec/os_spec.rb",
     "spec/platform/cacheable_spec.rb",
     "spec/platform/cached_file_spec.rb",
     "spec/platform/classes/cacheable_model.rb",
     "spec/platform/extension_cache_spec.rb",
     "spec/platform/extension_spec.rb",
     "spec/platform/helpers/extensions.rb",
     "spec/platform/helpers/extensions/circular.rb",
     "spec/platform/helpers/extensions/test.rb",
     "spec/platform/helpers/overlays.rb",
     "spec/platform/helpers/overlays/hello/cache/.keep",
     "spec/platform/helpers/overlays/hello/exts/hello.rb",
     "spec/platform/helpers/overlays/hello/lib/init.rb",
     "spec/platform/helpers/overlays/hello/lib/stuff/another_test.rb",
     "spec/platform/helpers/overlays/hello/lib/stuff/test.rb",
     "spec/platform/helpers/overlays/hello/ronin.xml",
     "spec/platform/helpers/overlays/random/cache/.keep",
     "spec/platform/helpers/overlays/random/exts/random.rb",
     "spec/platform/helpers/overlays/random/ronin.xml",
     "spec/platform/helpers/overlays/test1/cache/cacheable_model/one.rb",
     "spec/platform/helpers/overlays/test1/exts/test.rb",
     "spec/platform/helpers/overlays/test1/ronin.xml",
     "spec/platform/helpers/overlays/test2/cache/cacheable_model/exceptions.rb",
     "spec/platform/helpers/overlays/test2/cache/cacheable_model/load_errors.rb",
     "spec/platform/helpers/overlays/test2/cache/cacheable_model/no_method_errors.rb",
     "spec/platform/helpers/overlays/test2/cache/cacheable_model/syntax_errors.rb",
     "spec/platform/helpers/overlays/test2/cache/cacheable_model/two.rb",
     "spec/platform/helpers/overlays/test2/cache/cacheable_model/validation_errors.rb",
     "spec/platform/helpers/overlays/test2/exts/test.rb",
     "spec/platform/helpers/overlays/test2/ronin.xml",
     "spec/platform/maintainer_spec.rb",
     "spec/platform/overlay_cache_spec.rb",
     "spec/platform/overlay_spec.rb",
     "spec/platform/platform_spec.rb",
     "spec/ronin_spec.rb",
     "spec/spec_helper.rb",
     "spec/ui/command_line/classes/test_command.rb",
     "spec/ui/command_line/command_spec.rb",
     "spec/ui/output_spec.rb"
  ]
  s.has_rdoc = %q{yard}
  s.homepage = %q{http://github.com/ronin-ruby/ronin}
  s.licenses = ["GPL-2"]
  s.post_install_message = %q{
    Thank you for installing Ronin, a Ruby platform for exploit development
    and security research. To list the available commands:

      $ ronin help

    To jump into the Ronin Ruby Console:

      $ ronin

    Additional functionality can be added to Ronin by installing additional
    libraries:
    * ronin-asm
    * ronin-dorks
    * ronin-exploits
    * ronin-gen
    * ronin-int
    * ronin-php
    * ronin-scanners
    * ronin-sql
    * ronin-web
    }
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{A Ruby platform for exploit development and security research.}
  s.test_files = [
    "spec/author_spec.rb",
     "spec/os_spec.rb",
     "spec/installation_spec.rb",
     "spec/spec_helper.rb",
     "spec/ronin_spec.rb",
     "spec/ui/command_line/command_spec.rb",
     "spec/ui/command_line/classes/test_command.rb",
     "spec/ui/output_spec.rb",
     "spec/model/has_name_spec.rb",
     "spec/model/has_description_spec.rb",
     "spec/model/has_license_spec.rb",
     "spec/model/model_spec.rb",
     "spec/model/lazy_upgrade_spec.rb",
     "spec/model/models/named_model.rb",
     "spec/model/models/custom_model.rb",
     "spec/model/models/licensed_model.rb",
     "spec/model/models/lazy_model.rb",
     "spec/model/models/described_model.rb",
     "spec/model/models/basic_model.rb",
     "spec/license_spec.rb",
     "spec/platform/overlay_spec.rb",
     "spec/platform/extension_cache_spec.rb",
     "spec/platform/overlay_cache_spec.rb",
     "spec/platform/maintainer_spec.rb",
     "spec/platform/extension_spec.rb",
     "spec/platform/cached_file_spec.rb",
     "spec/platform/helpers/overlays.rb",
     "spec/platform/helpers/overlays/test2/exts/test.rb",
     "spec/platform/helpers/overlays/test2/cache/cacheable_model/two.rb",
     "spec/platform/helpers/overlays/test2/cache/cacheable_model/exceptions.rb",
     "spec/platform/helpers/overlays/test2/cache/cacheable_model/no_method_errors.rb",
     "spec/platform/helpers/overlays/test2/cache/cacheable_model/syntax_errors.rb",
     "spec/platform/helpers/overlays/test2/cache/cacheable_model/load_errors.rb",
     "spec/platform/helpers/overlays/test2/cache/cacheable_model/validation_errors.rb",
     "spec/platform/helpers/overlays/random/exts/random.rb",
     "spec/platform/helpers/overlays/test1/exts/test.rb",
     "spec/platform/helpers/overlays/test1/cache/cacheable_model/one.rb",
     "spec/platform/helpers/overlays/hello/exts/hello.rb",
     "spec/platform/helpers/overlays/hello/lib/init.rb",
     "spec/platform/helpers/overlays/hello/lib/stuff/test.rb",
     "spec/platform/helpers/overlays/hello/lib/stuff/another_test.rb",
     "spec/platform/helpers/extensions.rb",
     "spec/platform/helpers/extensions/test.rb",
     "spec/platform/helpers/extensions/circular.rb",
     "spec/platform/platform_spec.rb",
     "spec/platform/classes/cacheable_model.rb",
     "spec/platform/cacheable_spec.rb",
     "spec/helpers/database.rb",
     "spec/database_spec.rb",
     "spec/arch_spec.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<nokogiri>, ["~> 1.3.3"])
      s.add_runtime_dependency(%q<extlib>, ["~> 0.9.14"])
      s.add_runtime_dependency(%q<data_objects>, ["~> 0.10.1"])
      s.add_runtime_dependency(%q<do_sqlite3>, ["~> 0.10.1"])
      s.add_runtime_dependency(%q<dm-core>, ["~> 0.10.2"])
      s.add_runtime_dependency(%q<dm-types>, ["~> 0.10.2"])
      s.add_runtime_dependency(%q<dm-validations>, ["~> 0.10.2"])
      s.add_runtime_dependency(%q<dm-aggregates>, ["~> 0.10.2"])
      s.add_runtime_dependency(%q<dm-predefined>, ["~> 0.2.3"])
      s.add_runtime_dependency(%q<open-namespace>, ["~> 0.1.0"])
      s.add_runtime_dependency(%q<data_paths>, ["~> 0.2.1"])
      s.add_runtime_dependency(%q<contextify>, ["~> 0.1.5"])
      s.add_runtime_dependency(%q<pullr>, ["~> 0.1.2"])
      s.add_runtime_dependency(%q<thor>, ["~> 0.13.0"])
      s.add_runtime_dependency(%q<ronin-ext>, ["~> 0.1.0"])
      s.add_development_dependency(%q<rspec>, ["~> 1.3.0"])
      s.add_development_dependency(%q<yard>, ["~> 0.5.3"])
      s.add_development_dependency(%q<yard-dm>, ["~> 0.1.1"])
      s.add_development_dependency(%q<yard-dm-predefined>, ["~> 0.1.0"])
    else
      s.add_dependency(%q<nokogiri>, ["~> 1.3.3"])
      s.add_dependency(%q<extlib>, ["~> 0.9.14"])
      s.add_dependency(%q<data_objects>, ["~> 0.10.1"])
      s.add_dependency(%q<do_sqlite3>, ["~> 0.10.1"])
      s.add_dependency(%q<dm-core>, ["~> 0.10.2"])
      s.add_dependency(%q<dm-types>, ["~> 0.10.2"])
      s.add_dependency(%q<dm-validations>, ["~> 0.10.2"])
      s.add_dependency(%q<dm-aggregates>, ["~> 0.10.2"])
      s.add_dependency(%q<dm-predefined>, ["~> 0.2.3"])
      s.add_dependency(%q<open-namespace>, ["~> 0.1.0"])
      s.add_dependency(%q<data_paths>, ["~> 0.2.1"])
      s.add_dependency(%q<contextify>, ["~> 0.1.5"])
      s.add_dependency(%q<pullr>, ["~> 0.1.2"])
      s.add_dependency(%q<thor>, ["~> 0.13.0"])
      s.add_dependency(%q<ronin-ext>, ["~> 0.1.0"])
      s.add_dependency(%q<rspec>, ["~> 1.3.0"])
      s.add_dependency(%q<yard>, ["~> 0.5.3"])
      s.add_dependency(%q<yard-dm>, ["~> 0.1.1"])
      s.add_dependency(%q<yard-dm-predefined>, ["~> 0.1.0"])
    end
  else
    s.add_dependency(%q<nokogiri>, ["~> 1.3.3"])
    s.add_dependency(%q<extlib>, ["~> 0.9.14"])
    s.add_dependency(%q<data_objects>, ["~> 0.10.1"])
    s.add_dependency(%q<do_sqlite3>, ["~> 0.10.1"])
    s.add_dependency(%q<dm-core>, ["~> 0.10.2"])
    s.add_dependency(%q<dm-types>, ["~> 0.10.2"])
    s.add_dependency(%q<dm-validations>, ["~> 0.10.2"])
    s.add_dependency(%q<dm-aggregates>, ["~> 0.10.2"])
    s.add_dependency(%q<dm-predefined>, ["~> 0.2.3"])
    s.add_dependency(%q<open-namespace>, ["~> 0.1.0"])
    s.add_dependency(%q<data_paths>, ["~> 0.2.1"])
    s.add_dependency(%q<contextify>, ["~> 0.1.5"])
    s.add_dependency(%q<pullr>, ["~> 0.1.2"])
    s.add_dependency(%q<thor>, ["~> 0.13.0"])
    s.add_dependency(%q<ronin-ext>, ["~> 0.1.0"])
    s.add_dependency(%q<rspec>, ["~> 1.3.0"])
    s.add_dependency(%q<yard>, ["~> 0.5.3"])
    s.add_dependency(%q<yard-dm>, ["~> 0.1.1"])
    s.add_dependency(%q<yard-dm-predefined>, ["~> 0.1.0"])
  end
end

