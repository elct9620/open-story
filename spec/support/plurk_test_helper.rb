# frozen_string_literal: true

module PlurkTestHelper
  DEFAULT_CHANNEL_NAME = 'generic-4-f733d8522327edf87b4d1651e6395a6cca0807a0'
  DEFAULT_CHANNEL_SERVER = 'https://comet03.plurk.com/comet/1235515351741/?channel=generic-4-f733d8522327edf87b4d1651e6395a6cca0807a0'

  def stub_api_create_channel(name: nil, server: nil)
    stub_request(:get, %r{https://www.plurk.com/APP/Realtime/getUserChannel})
      .to_return(
        status: 200,
        body: {
          comet_server: server || DEFAULT_CHANNEL_SERVER,
          channel_name: name || DEFAULT_CHANNEL_NAME
        }.to_json
      )
  end

  def stub_api_me(user_id: 9999, nickname: 'openstory')
    stub_request(:get, %r{https://www.plurk.com/APP/Users/me})
      .to_return(status: 200, body: { id: user_id, nick_name: nickname }.to_json)
  end

  def stub_api_add_response
    stub_request(:get, %r{https://www.plurk.com/APP/Responses/responseAdd})
      .to_return(status: 200, body: '{}')
  end

  def stub_api_add_all_friends
    stub_request(:get, %r{https://www.plurk.com/APP/Alerts/addAllAsFriends})
      .to_return(status: 200, body: {}.to_json)
  end
end
