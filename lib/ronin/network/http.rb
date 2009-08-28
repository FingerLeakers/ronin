#
# Ronin - A Ruby platform designed for information security and data
# exploration tasks.
#
# Copyright (c) 2006-2009 Hal Brodigan (postmodern.mod3 at gmail.com)
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
#

require 'ronin/network/extensions/http'
require 'ronin/network/http/exceptions/unknown_request'

module Ronin
  module Network
    module HTTP
      # Common HTTP proxy port
      COMMON_PROXY_PORT = 8080

      #
      # @return [Integer] The default Ronin HTTP proxy port to use for
      #                   HTTP proxies.
      #
      def HTTP.default_proxy_port
        @@http_default_proxy_port ||= COMMON_PROXY_PORT
      end

      #
      # Sets the default Ronin HTTP proxy port.
      #
      # @param [Integer] port The new proxy port to use.
      #
      def HTTP.default_proxy_port=(port)
        @@http_default_proxy_port = port
      end

      #
      # @return [Hash] The default Ronin HTTP proxy hash.
      #
      def HTTP.default_proxy
        {:host => nil, :port => HTTP.default_proxy_port, :user => nil, :pass => nil}
      end

      #
      # @return [Hash] The Ronin HTTP proxy hash.
      #
      def HTTP.proxy
        @@http_proxy ||= default_proxy
      end

      #
      # Resets the Ronin HTTP proxy setting.
      #
      def HTTP.disable_proxy
        @@http_proxy = default_proxy
      end

      #
      # @return [String, nil] The default Ronin HTTP User-Agent.
      #
      def HTTP.user_agent
        @@http_user_agent ||= nil
      end

      #
      # Sets the default Ronin HTTP User-Agent.
      #
      # @param [String] agent The new User-Agent string to use.
      #
      def HTTP.user_agent=(agent)
        @@http_user_agent = agent
      end

      #
      # Expands the given HTTP _options_.
      #
      # @param [Hash] options HTTP options.
      # @option options [String, URI::HTTP, URI::HTTPS] :url The URL to
      #                                                      request.
      # @option options [String] :host The host to connect to.
      # @option options [String] :port (Ronin::Network::HTTP.default_proxy_port)
      #                                The port to connect to.
      # @option options [String] :user The user to authenticate as.
      # @option options [String] :password The password to authenticate
      #                                    with.
      # @option options [String] :path ('/') The path to request.
      # @option options [Hash] :proxy (Ronin::Network::HTTP.proxy) 
      #                                 The Proxy information.
      #
      # @return [Hash] The expanded version of _options_.
      #
      def HTTP.expand_options(options={})
        new_options = options.dup

        if new_options[:url]
          url = URI(new_options.delete(:url).to_s)

          new_options[:host] = url.host
          new_options[:port] = url.port

          new_options[:user] = url.user if url.user
          new_options[:password] = url.password if url.password

          unless url.path.empty?
            new_options[:path] = url.path
          else
            new_options[:path] = '/'
          end

          new_options[:path] << "?#{url.query}" if url.query
        else
          new_options[:port] ||= ::Net::HTTP.default_port
          new_options[:path] ||= '/'
        end

        if (proxy = new_options[:proxy])
          proxy[:port] ||= Ronin::Network::HTTP.default_proxy_port
        else
          new_options[:proxy] = Ronin::Network::HTTP.proxy
        end

        return new_options
      end

      #
      # Converts underscored, dashed, lowercase and uppercase HTTP headers
      # to standard camel-cased HTTP headers.
      #
      # @param [Hash{Symbol,String => String}] options Ronin HTTP headers.
      #
      # @return [Hash] The camel-cased HTTP headers created from the given
      #                _options_.
      #
      def HTTP.headers(options={})
        headers = {}

        if HTTP.user_agent
          headers['User-Agent'] = HTTP.user_agent
        end

        if options
          options.each do |name,value|
            header_name = name.to_s.split(/[\s+_-]/).map { |word|
              word.capitalize
            }.join('-')

            headers[header_name] = value.to_s
          end
        end

        return headers
      end

      #
      # Creates an HTTP request object with the specified _type_ and
      # given _options_. If type does not represent the name of an Net:HTTP
      # Request Class an UnknownRequest exception will be raised.
      #
      # @param [Hash] options The HTTP options for the request.
      # @option options [Symbol, String] :method The HTTP method to use for
      #                                          the request.
      # @option options [String] :path ('/') The path to request.
      # @option options [String] :user The user to authenticate as.
      # @option options [String] :password The password to authenticate
      #                                    with.
      # @option options [Hash{Symbol,String => String}] :headers
      #                                                  Additional HTTP
      #                                                  headers to use
      #                                                  for the request.
      #
      # @return [HTTP::Request] The new HTTP Request object.
      #
      # @raise [ArgumentError] The +:method+ option must be specified.
      # @raise [UnknownRequest] The +:method+ option did not match a known
      #                         Net::HTTP request class.
      #
      # @see HTTP.expand_options
      #
      def HTTP.request(options={})
        unless options[:method]
          raise(ArgumentError,"the :method option must be specified",caller)
        end

        name = options[:method].to_s.capitalize

        unless Net::HTTP.const_defined?(name)
          raise(UnknownRequest,"unknown HTTP request type #{name.dump}",caller)
        end

        headers = HTTP.headers(options[:headers])
        path = (options[:path] || '/').to_s

        request = Net::HTTP.const_get(name).new(path,headers)

        if (user = options.delete(:user))
          user = user.to_s

          if (password = options.delete(:password))
            password = password.to_s
          end

          request.basic_auth(user,password)
        end

        return request
      end
    end
  end
end
