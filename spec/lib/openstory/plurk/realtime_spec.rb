# frozen_string_literal: true

require 'openstory/plurk'

RSpec.describe OpenStory::Plurk::Realtime do
  subject(:realtime) { described_class.new(channel) }

  let(:channel) { OpenStory::Plurk::Channel.new(name: 'DUMMY', server: 'https://comet03.plurk.com/comet/1235515351741/?channel=generic-4-f733d8522327edf87b4d1651e6395a6cca0807a0&offset=0') }

  it { is_expected.not_to be_stopped }

  context 'when stopped' do
    before { realtime.stop }

    it { is_expected.to be_stopped }
  end

  describe '#event_stream' do
    subject { realtime.take(1) }

    let(:data) { [] }

    before do
      stub_request(:get, 'https://comet03.plurk.com/comet/1235515351741/?channel=generic-4-f733d8522327edf87b4d1651e6395a6cca0807a0&offset=0')
        .to_return(status: 200, body: "CometChannel.scriptCallback({\"data\": #{data.to_json}})").then
        .to_raise(StopIteration)
    end

    it { is_expected.to be_empty }

    context 'when return notification' do
      let(:data) { [{ type: 'update_notification' }] }

      it { is_expected.to include(Hash) }
    end

    context 'when return plurk' do
      let(:data) { [{ type: 'new_plurk', id: 1, content: 'Hello', content_raw: 'Hello', user_id: 1 }] }

      it { is_expected.to include(OpenStory::Plurk::Plurk) }
    end

    context 'when return response' do
      let(:data) { [{ type: 'new_response', response: { id: 1, plurk_id: 1, content: 'Hello', user_id: 1 } }] }

      it { is_expected.to include(OpenStory::Plurk::Response) }
    end
  end
end
