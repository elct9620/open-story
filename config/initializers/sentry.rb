# frozen_string_literal: true

require 'sentry-ruby'

Sentry.init do |config|
  config.traces_sample_rate = 1.0
end
