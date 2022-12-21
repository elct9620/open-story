# frozen_string_literal: true

require 'dry/container'
require 'sentry-ruby'

module OpenStory
  module Bridge
    # The event manager to bridge extenal source
    class Server
      include Dry::Container::Mixin

      attr_reader :router, :logger, :notifications

      def initialize(router, logger, notifications)
        @router = router
        @logger = logger
        @notifications = notifications
      end

      def start
        each
          .map { |_, observer| bootstrap(observer) }
          .each(&:join)
      end

      def bootstrap(observer)
        worker = Worker.new(router, observer, notifications)
        Thread.new do
          loop do
            worker.next
          rescue RuntimeError => e
            @logger.error e
            Sentry.capture_exception(e)
          end
        end
      end
    end
  end
end
