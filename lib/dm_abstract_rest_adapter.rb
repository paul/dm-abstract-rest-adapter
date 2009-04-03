
require 'resourceful'
require 'dm-core/adapters/abstract_adapter'

module DataMapper::Adapters

  class AbstractRestAdapter < AbstractAdapter

    attr_reader :http_accessor

    def initialize(name, options)
      super

      @http = Resourceful::HttpAccessor.new
      @http.logger = @options[:logger] || Resourceful::BitBucketLogger.new

      setup_authenticator
      setup_cache_manager

    end

    def setup_authenticator
      return unless  auth_mode = @options[:auth]

      realm = @options[:realm]
      username, password = @options[:username], @options[:password]
      if auth_mode = :basic
        @http.add_authenticator Resourceful::BasicAuthenticator.new(realm, username, password)
      elsif auth_mode == :digest
        @http.add_authenticator Resourceful::DigestAuthenticator.new(realm, username, password)
      end
    end

    def setup_cache_manager
      return unless cache_manager = @options[:caching]
      if cache_manager == true || cache_manager == :in_memory
        @http.cache_manager = Resourceful::InMemoryCacheManager.new
      end
    end

    def logger
      @http.logger
    end

  end

end

