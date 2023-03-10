# frozen_string_literal: true

require 'bundler'
require 'dry/cli'

require 'openstory/core'
require_relative 'cli/commands'

module OpenStory
  # Command Line
  #
  # The command line for open story system
  module CLI
    module_function

    # start the command line
    def start
      OpenStory.initialize!
      OpenStory.finalize!
      Dry::CLI.new(OpenStory::CLI::Commands).call
    end
  end
end
