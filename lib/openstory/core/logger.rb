# frozen_string_literal: true

require 'dry/logger'

module OpenStory
  # The default logger
  class Logger < Dry::Logger::Dispatcher
    TEMPLATE = '[%<severity>s] [%<time>s] %<message>s %<payload>s'
    def initialize(stream, **options, &block)
      super(OpenStory.app_class, **Dry::Logger::DEFAULT_OPTS, template: TEMPLATE, **options)
      yield(self) if block
      add_backend(stream:) if backends.empty?
    end
  end
end
