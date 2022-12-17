# frozen_string_literal: true

require 'bundler/setup'
require 'dry/configurable'

module OpenStory
  module Plurk
    extend Dry::Configurable

    setting :app_key, reader: true, constructor: proc { |value| value || ENV.fetch('PLURK_APP_KEY', nil) }
    setting :app_secret, reader: true, constructor: proc { |value| value || ENV.fetch('PLURK_APP_SECRET', nil) }
    setting :token, reader: true, constructor: proc { |value| value || ENV.fetch('PLURK_ACCESS_TOKEN', nil) }
    setting :secret, reader: true, constructor: proc { |value| value || ENV.fetch('PLURK_SECRET_TOKEN', nil) }
  end
end
