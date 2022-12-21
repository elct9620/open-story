# frozen_string_literal: true

$LOAD_PATH.unshift("#{File.dirname(__dir__)}/lib")

require 'dotenv'
Dotenv.load

require 'openstory/plurk'

# :nodoc:
class ClosedWorld < OpenStory::Application
  register_provider(:observer, from: :plurk) do
    configure do |config|
      config.app.key = ENV.fetch('PLURK_APP_KEY', nil)
      config.app.secret = ENV.fetch('PLURK_APP_SECRET', nil)
      config.token = ENV.fetch('PLURK_ACCESS_TOKEN', nil)
      config.secret = ENV.fetch('PLURK_SECRET_TOKEN', nil)

      config.allowlist = ENV.fetch('PLURK_ALLOWED_USER_IDS', nil)
    end
  end
end
