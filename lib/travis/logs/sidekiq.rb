require 'sidekiq'
require 'sidekiq/redis_connection'
require 'travis/logs/sidekiq/archive'

module Travis
  module Logs
    module Sidekiq
      class << self
        def setup
          Travis.logger.info('Setting up Sidekiq and the Redis connection')
          url = Logs.config.redis.url
          namespace = Logs.config.sidekiq.namespace
          pool_size = Logs.config.sidekiq.pool_size
          ::Sidekiq.configure_client do |c|
            c.logger = Travis.logger
            c.redis = ::Sidekiq::RedisConnection.create({ :url => url, :namespace => namespace, :size => pool_size })
          end
        end
      end
    end
  end
end
