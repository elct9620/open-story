# frozen_string_literal: true

Dry::System.register_provider_source(:observer, group: :plurk) do
  setting :app do
    setting :key
    setting :secret
  end

  setting :token
  setting :secret

  setting :keyword, default: '#OpenStory'
  setting :allowlist, default: '', constructor: proc { |value| value.to_s.split(',').map(&:to_i) }

  start do
    token = OpenStory::Plurk::Token.new(token: config.token, secret: config.secret)
    oauth = OpenStory::Plurk::OAuth.new(key: config.app.key, secret: config.app.secret, token:)
    api = OpenStory::Plurk::HTTP.new(oauth)
    observer = OpenStory::Plurk::Observer.new(api, keyword: config.keyword, allowlist: config.allowlist)

    register(:observer, observer)
  end
end
