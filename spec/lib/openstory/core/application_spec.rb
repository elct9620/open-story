# frozen_string_literal: true

require 'openstory/core'

RSpec.describe OpenStory::Application do # rubocop:disable RSpec/FilePath
  subject { described_class.instance }

  describe '.inherited' do
    subject(:app) { Class.new(described_class) }

    it { is_expected.to have_attributes(ancestors: include(described_class)) }
    it { is_expected.to eq(OpenStory.app_class) }
    it { is_expected.not_to be_configured }

    context 'when configured' do
      before { app.configure }

      it { is_expected.to be_configured }
    end
  end

  describe '#router' do
    it { is_expected.to have_attributes(router: be_a(OpenStory::Router)) }
  end
end
