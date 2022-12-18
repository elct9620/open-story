# frozen_string_literal: true

$LOAD_PATH.unshift("#{File.dirname(__dir__)}/lib")

require_relative '../../config/application'

if ENV.fetch('COVERAGE', false) || ENV.fetch('CI', false)
  require 'simplecov'
  require 'simplecov-cobertura'

  SimpleCov.formatter = SimpleCov::Formatter::CoberturaFormatter if ENV.fetch('GITLAB_CI', false)

  SimpleCov.start do
    add_filter 'vendor'
  end
end

OpenStory.initialize!
