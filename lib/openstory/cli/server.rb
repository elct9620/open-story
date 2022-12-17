# frozen_string_literal: true

module OpenStory
  module CLI
    # Run open story server
    class Server < Dry::CLI::Command
      desc 'start the server'

      def call(*)
        puts 'server is started...'
      end
    end
  end
end
