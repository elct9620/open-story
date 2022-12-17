# frozen_string_literal: true

module OpenStory
  module CLI
    # Run open story console
    class Console < Dry::CLI::Command
      desc 'start the interactive console'

      def call(*)
        ARGV.clear
        require 'pry'
        return ::Pry.start if defined?(::Pry)

        require 'irb'
        IRB.start
      end
    end
  end
end
