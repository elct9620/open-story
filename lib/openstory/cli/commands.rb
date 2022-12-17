# frozen_string_literal: true

require_relative 'server'
require_relative 'console'

module OpenStory
  module CLI
    module Commands
      extend Dry::CLI::Registry

      register 'server', Server, aliases: ['s']
      register 'console', Console, aliases: ['c']
    end
  end
end
