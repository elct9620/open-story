# frozen_string_literal: true

require_relative 'server'

module OpenStory
  module CLI
    module Commands
      extend Dry::CLI::Registry

      register 'server', Server, aliases: ['s']
    end
  end
end
