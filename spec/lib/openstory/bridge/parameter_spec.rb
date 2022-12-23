# frozen_string_literal: true

require 'openstory/bridge'

RSpec.describe OpenStory::Bridge::Parameter do
  subject(:params) { described_class.new(env) }

  describe '#[]' do
    subject { params[:name] }

    let(:env) { { params: { 'name' => 'Bob' } } }

    it { is_expected.to eq('Bob') }

    context 'when key is string' do
      subject { params['name'] }

      it { is_expected.to eq('Bob') }
    end
  end
end
