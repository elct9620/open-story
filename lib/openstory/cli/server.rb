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

        OpenStory.observer.start
      end
    end
  end
end
