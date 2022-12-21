# frozen_string_literal: true

require 'openstory/bridge'

RSpec.describe OpenStory::Bridge::Server do
  subject(:bridge) { described_class.new }

  describe '#start' do
    let(:observer) do
      Class.new do
        def next; end
        def reply_to(id, content); end
      end.new
    end

    before do
      app = Class.new(OpenStory::Application)
      app.register('bridge_action', Class.new { def call(*) = 'PONG' }.new)
      app.configure
      app.instance.router.default(to: 'bridge')

      allow(observer).to receive(:next).and_invoke(-> { [1, 'PING'] }, -> { raise StopIteration })
      allow(observer).to receive(:reply_to)
      bridge.register(:raw, observer)
      bridge.start
    end

    it { expect(observer).to have_received(:reply_to).with(1, 'PONG') }
  end
end
