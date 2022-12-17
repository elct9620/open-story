# frozen_string_literal: true

require 'dry/system/provider_sources'

ClosedWorld.register_provider(:settings, from: :dry_system) do
  settings do
    setting :plurk do
      setting :app_key, constructor: proc { |value| value || ENV.fetch('PLURK_APP_KEY', nil) }
      setting :app_secret, constructor: proc { |value| value || ENV.fetch('PLURK_APP_SECRET', nil) }
      setting :token, constructor: proc { |value| value || ENV.fetch('PLURK_ACCESS_TOKEN', nil) }
      setting :secret, constructor: proc { |value| value || ENV.fetch('PLURK_SECRET_TOKEN', nil) }
    end
  end
end
