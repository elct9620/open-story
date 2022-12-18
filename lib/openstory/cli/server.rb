# frozen_string_literal: true

module OpenStory
  module CLI
    # Run open story server
    class Server < Dry::CLI::Command
      desc 'start the server'

      def call(*)
        $stdout.sync = true

        OpenStory.logger.add_backend(stream: $stdout)
        OpenStory.logger.info('Starting server...')

        raise 'observer not configured' unless OpenStory.observer

        OpenStory.observer.start do |content|
          dispatch content
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
end
