# frozen_string_literal: true

require 'simplecov'

ENV['DYNO'] = nil
ENV['ENV'] = ENV['RACK_ENV'] = 'test'
ENV['REDIS_URL'] = 'redis://localhost:6379/0'
ENV['TRAVIS_LOGS_DRAIN_BATCH_SIZE'] = '1'
ENV['TRAVIS_S3_HOSTNAME'] = 'archive-test.travis-ci.org'

require 'travis/exceptions'
require 'travis/logs'

Travis.logger.level = Logger::FATAL

Travis::Exceptions.setup(
  Travis.config,
  Travis.config.env,
  Travis.logger
)
