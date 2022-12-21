# frozen_string_literal: true

require 'openstory/bridge'
require 'openstory/bridge/mock_observer'

RSpec.describe OpenStory::Bridge::Worker do
  subject(:worker) { described_class.new(router, observer) }

  let(:router) { OpenStory::Router.new }
  let(:observer) { instance_double(OpenStory::Bridge::MockObserver) }

  describe '#next' do
    before do
      app = Class.new(OpenStory::Application)
      app.register('bridge_action', Class.new { def call(*) = 'PONG' }.new)
      app.configure
      router.default(to: 'bridge')

      allow(observer).to receive(:next).and_return([1, 'PING'])
      allow(observer).to receive(:reply_to)
      worker.next
    end

    it { expect(observer).to have_received(:reply_to).with(1, 'PONG') }
  end
end
