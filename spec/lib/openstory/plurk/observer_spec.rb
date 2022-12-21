# frozen_string_literal: true

require_relative '../../../support/plurk_test_helper'

RSpec.describe OpenStory::Plurk::Observer do
  include PlurkTestHelper

  subject(:observer) { described_class.new(api) }

  let(:oauth) { OpenStory::Plurk::OAuth.new(key: 'APP_KEY', secret: 'APP_SECRET', token:) }
  let(:token) { OpenStory::Plurk::Token.new(token: 'USER_TOKEN', secret: 'USER_SECRET') }
  let(:api) { OpenStory::Plurk::HTTP.new(oauth) }

  before do
    stub_api_create_channel
    stub_api_me
  end

  describe '#allowed?' do
    subject { observer.allowed?(1) }

    it { is_expected.to be_truthy }

    context 'when allow list is configured' do
      let(:observer) { described_class.new(api, allowlist: [1]) }

      it { is_expected.to be_truthy }
    end
  end

  describe '#reply_to' do
    it 'calls response api' do
      request = stub_api_add_response
      observer.reply_to(1, 'PONG')
      expect(request).to have_been_requested
    end

    context 'when content is empty' do
      it 'does not call response api' do
        request = stub_api_add_response
        observer.reply_to(1, '')
        expect(request).not_to have_been_requested
      end
    end
  end

  describe '#next' do
    subject(:fetch_next) { observer.next }

    let(:realtime) { instance_spy(OpenStory::Plurk::Realtime) }

    before do
      allow(Random).to receive(:rand).and_return(10_000)
      allow(Time).to receive(:now).and_return(Time.parse('2022-12-17 20:30:00 +08:00'))
      allow(OpenStory::Plurk::Realtime).to receive(:new).and_return(realtime)
      allow(realtime).to receive(:next).and_return(event)
      allow(api).to receive(:accept_all_friends).and_call_original

      stub_api_add_all_friends
    end

    context 'when new plurk received' do
      let(:event) do
        OpenStory::Plurk::Plurk.new(id: 123, user_id: 1, content: 'a plurk', content_raw: '')
      end

      it { is_expected.to include(id: 123) }
      it { is_expected.to include(content: 'a plurk') }
      it { is_expected.to include(source: :plurk) }
      it { is_expected.to include(user_id: 1) }
    end

    context 'when new response received' do
      let(:event) do
        OpenStory::Plurk::Response.new(
          user_id: 1,
          plurk_id: 99,
          content: 'a response',
          plurk: OpenStory::Plurk::Plurk.new(id: 99, user_id: 68, content: 'a plurk', content_raw: '')
        )
      end

      it { is_expected.to include(id: 99) }
      it { is_expected.to include(content: 'a response') }
      it { is_expected.to include(source: :plurk) }
      it { is_expected.to include(user_id: 1) }
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
