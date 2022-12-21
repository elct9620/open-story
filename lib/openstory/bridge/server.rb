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
        Thread.new do
          loop do
            process(observer)
          rescue StopIteration
            break
          rescue StandardError => e
            Sentry.capture_exception(e)
          end
        end
      end

      def process(observer)
        id, content = observer.next
        return unless id && content

        res = dispatch content
        observer.reply_to id, res
      end

      def dispatch(content)
        route = OpenStory.application.router.match(content)
        return unless route

        OpenStory.notifications.instrument('action.execute', action: route.action_name, content:) do
          route.resolve.call
        end
      end
    end
  end
end
