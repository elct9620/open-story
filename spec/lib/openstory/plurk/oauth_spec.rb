# frozen_string_literal: true

require 'openstory/plurk'

RSpec.describe OpenStory::Plurk::OAuth do
  subject(:oauth) { described_class.new(key: 'APP_KEY', secret: 'APP_SECRET', token:) }

  let(:token) { OpenStory::Plurk::Token.new(token: 'USER_TOKEN', secret: 'USER_SECRET') }

  describe '#sign' do
    subject { oauth.sign('GET', 'DUMMY_URL', {}) }

    before do
      allow(Random).to receive(:rand).and_return(10_000)
      allow(Time).to receive(:now).and_return(Time.parse('2022-12-17 20:30:00'))
    end

    it { is_expected.to eq('mbqQ5pRhRnw4va8M0AHsvEyKhMs=') }
  end

  describe '#params' do
    it { is_expected.to have_attributes(params: include(oauth_consumer_key: 'APP_KEY')) }
    it { is_expected.to have_attributes(params: include(oauth_nonce: be_a(String))) }
    it { is_expected.to have_attributes(params: include(oauth_signature_method: 'HMAC-SHA1')) }
    it { is_expected.to have_attributes(params: include(oauth_timestamp: be_a(Integer))) }
    it { is_expected.to have_attributes(params: include(oauth_token: 'USER_TOKEN')) }
    it { is_expected.to have_attributes(params: include(oauth_version: '1.0')) }
  end
end
