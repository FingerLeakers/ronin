#
# Copyright (c) 2006-2011 Hal Brodigan (postmodern.mod3 at gmail.com)
#
# This file is part of Ronin.
#
# Ronin is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# Ronin is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with Ronin.  If not, see <http://www.gnu.org/licenses/>.
#

require 'tempfile'

module Ronin
  module UI
    module Console
      #
      # Adds the `edit` command to the Ronin Console.
      #
      # @since 1.2.0
      #
      module Edit
        EDITOR = ENV['EDITOR']

        #
        # Detects the edit command.
        #
        # @param [String] input
        #   The input from the console.
        #
        # @api private
        #
        def loop_eval(input)
          if (input == 'edit' || input == EDITOR)
            return edit(Tempfile.new(['ronin-console', '.rb']).path)
          elsif (input.start_with?('edit ') ||
                 (EDITOR && input.start_with?("#{EDITOR} ")))
            return edit(input.split(' ',2)[1])
          end

          super(input)
        end

        protected

        #
        # Edits a path and re-loads the code.
        #
        # @param [String] path 
        #   The path of the file to re-load.
        #
        # @return [Boolean]
        #   Specifies whether the code was successfully re-loaded.
        #
        # @api private
        #
        def edit(path)
          if EDITOR
            system(EDITOR,path) && load(path)
          else
            raise("Please set the EDITOR env variable")
          end
        end
      end
    end
  end
end

Ripl::Shell.send :include, Ronin::UI::Console::Edit
