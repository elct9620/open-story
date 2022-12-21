# frozen_string_literal: true

require 'openstory/core'

RSpec.describe OpenStory::Router do # rubocop:disable RSpec/FilePath
  subject(:router) { described_class.new(container) }

  let(:container) { Dry::Container.new }

  before do
    router.draw do
      action(/talk/, to: 'talk')
      action(/talk/, to: 'duplicate')
    end
  end

  it { is_expected.to include(/talk/) }
  it { is_expected.to have_attributes(size: 1) }

  describe '#match' do
    subject { router.match('talk') }

    it { is_expected.to have_attributes(action_name: 'talk_action') }

    context 'when not matched' do
      subject { router.match('empty') }

      it { is_expected.to be_nil }
    end

    context 'when not matched with default' do
      subject { router.match('empty') }

      before { router.default(to: 'default') }

      it { is_expected.to have_attributes(action_name: 'default_action') }
    end
  end
end
