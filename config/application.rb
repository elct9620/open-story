# frozen_string_literal: true

require 'dotenv'
Dotenv.load

require 'openstory/plurk'

# :nodoc:
class ClosedWorld < OpenStory::Application
  configure do |config|
    config.observer = OpenStory::Plurk::Observer.new do |c|
      c.app.key = ENV.fetch('PLURK_APP_KEY', nil)
      c.app.secret = ENV.fetch('PLURK_APP_SECRET', nil)
      c.token = ENV.fetch('PLURK_ACCESS_TOKEN', nil)
      c.secret = ENV.fetch('PLURK_SECRET_TOKEN', nil)
    end
  end
end
