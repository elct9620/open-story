# frozen_string_literal: true

ClosedWorld.register_provider(:plurk) do
  prepare do
    require 'openstory/plurk'
  end

  start do
    config = target[:settings].plurk
    token = OpenStory::Plurk::Token.new(
      token: config.token,
      secret: config.secret
    )

    oauth = OpenStory::Plurk::OAuth.new(
      key: config.app_key,
      secret: config.app_secret,
      token:
    )

    register('plurk', OpenStory::Plurk::HTTP.new(oauth))
  end
end
