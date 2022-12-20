# frozen_string_literal: true

require 'dry/container'
require 'sentry-ruby'

module OpenStory
  # The event manager to bridge extenal source
  class Bridge
    include Dry::Container::Mixin

    def start
      each
        .map { |_, observer| bootstrap(observer) }
        .each(&:join)
    end

    def bootstrap(observer)
      Thread.new do
        observer.start do |content|
          dispatch content
        rescue StandardError => e
          Sentry.capture_exception(e)
        end
      end
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
