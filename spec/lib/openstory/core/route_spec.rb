# frozen_string_literal: true

require 'openstory/core'

RSpec.describe OpenStory::Route do # rubocop:disable RSpec/FilePath
  subject(:route) { described_class.new('talk', to: 'talk') }

  describe '#resolve' do
    let(:action_class) { Class.new(OpenStory::Action) }

    before do
      app = Class.new(OpenStory::Application)
      app.register('talk_action', action_class)
    end

    it { is_expected.to have_attributes(resolve: action_class) }
  end
end
