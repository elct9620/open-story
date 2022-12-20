# frozen_string_literal: true

require_relative '../../../support/plurk_test_helper'

RSpec.describe OpenStory::Plurk::Observer do
  include PlurkTestHelper

  subject(:observer) { described_class.new(api) }

  let(:oauth) { OpenStory::Plurk::OAuth.new(key: 'APP_KEY', secret: 'APP_SECRET', token:) }
  let(:token) { OpenStory::Plurk::Token.new(token: 'USER_TOKEN', secret: 'USER_SECRET') }
  let(:api) { OpenStory::Plurk::HTTP.new(oauth) }

  describe '#next' do
    subject(:fetch_next) { observer.next }

    let(:realtime) { instance_spy(OpenStory::Plurk::Realtime) }

    before do
      allow(Random).to receive(:rand).and_return(10_000)
      allow(Time).to receive(:now).and_return(Time.parse('2022-12-17 20:30:00 +08:00'))
      allow(OpenStory::Plurk::Realtime).to receive(:new).and_return(realtime)
      allow(realtime).to receive(:next).and_return(event)
      allow(api).to receive(:accept_all_friends).and_call_original

      stub_api_create_channel
      stub_api_me
      stub_api_add_response
      stub_api_add_all_friends
    end

    context 'when new plurk received' do
      let(:event) do
        OpenStory::Plurk::Plurk.new(id: 123, user_id: 1, content: 'a plurk', content_raw: '')
      end

      it { is_expected.to include(123) }
      it { is_expected.to include('a plurk') }
    end

    context 'when new response received' do
      let(:event) do
        OpenStory::Plurk::Response.new(
          user_id: 1,
          plurk_id: 99,
          content: 'a response',
          plurk: OpenStory::Plurk::Plurk.new(id: 99, user_id: 1, content: 'a plurk', content_raw: '')
        )
      end

      it { is_expected.to include(99) }
      it { is_expected.to include('a response') }
    end

    context 'when new notification received' do
      let(:event) { {} }

      it { is_expected.to be_nil }
    end

    context 'when new notification is friend request' do
      let(:event) { { 'counts' => { 'req' => 1 } } }

      it 'accepts all friends' do
        fetch_next
        expect(api).to have_received(:accept_all_friends)
      end
    end
  end
end
