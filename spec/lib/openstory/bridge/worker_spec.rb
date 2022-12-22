# frozen_string_literal: true

require 'openstory/bridge'
require 'openstory/bridge/mock_observer'

RSpec.describe OpenStory::Bridge::Worker do
  subject(:worker) { described_class.new(router, observer, notifications) }

  let(:container) { Dry::Container.new }
  let(:router) { OpenStory::Router.new(container) }
  let(:observer) { instance_double(OpenStory::Bridge::MockObserver) }
  let(:notifications) { Dry::Monitor::Notifications.new(:test) }

  describe '#next' do
    before do
      container.register('bridge_action', Class.new(OpenStory::Action) { def handle(*) = 'PONG' }.new)
      router.default(to: 'bridge')

      allow(observer).to receive(:next).and_return({ id: 1, content: 'PING' })
      allow(observer).to receive(:reply_to)
      worker.next
    end

    it { expect(observer).to have_received(:reply_to).with(1, 'PONG') }
  end
end
