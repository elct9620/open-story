# frozen_string_literal: true

require 'openstory/bridge'
require 'openstory/bridge/mock_observer'

RSpec.describe OpenStory::Bridge::Server do
  subject(:server) { described_class.new }

  describe '#start' do
    let(:worker) { instance_double(OpenStory::Bridge::Worker) }

    before do
      app = Class.new(OpenStory::Application)
      app.configure

      allow(OpenStory::Bridge::Worker).to receive(:new).and_return(worker)
      allow(worker).to receive(:next).and_raise(StopIteration)

      server.register(:raw, OpenStory::Bridge::MockObserver)
      server.start
    end

    it { expect(worker).to have_received(:next) }
  end
end
