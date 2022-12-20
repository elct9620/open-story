# frozen_string_literal: true

require 'openstory/core'

RSpec.describe OpenStory::Bridge do # rubocop:disable RSpec/FilePath
  subject(:bridge) { described_class.new }

  describe '#start' do
    let(:io) { StringIO.new }

    before do
      app = Class.new(OpenStory::Application)
      app.register('bridge_action', Class.new { def call(*) = 'PONG' }.new)
      app.configure
      app.instance.router.default(to: 'bridge')

      observer = Class.new { def start; end }.new
      allow(observer).to receive(:start) do |&block|
        io.write block.call('PING')
      end
      bridge.register(:raw, observer)
      bridge.start
    end

    it { expect(io).to have_attributes(string: 'PONG') }
  end
end
