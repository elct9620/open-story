# frozen_string_literal: true

require 'dry/container'
require 'sentry-ruby'

module OpenStory
  module Bridge
    # The event manager to bridge extenal source
    class Server
      include Dry::Container::Mixin

      def start
        each
          .map { |_, observer| bootstrap(observer) }
          .each(&:join)
      end

      def bootstrap(observer)
        worker = Worker.new(OpenStory.application.router, observer)
        Thread.new do
          loop do
            worker.next
          rescue RuntimeError => e
            Sentry.capture_exception(e)
          end
        end
      end
    end
  end
end
