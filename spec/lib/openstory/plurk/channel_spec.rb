# frozen_string_literal: true

require 'openstory/plurk'

RSpec.describe OpenStory::Plurk::Channel do
  subject(:channel) { described_class.new(name: 'DUMMY', server: 'https://comet03.plurk.com/comet/1235515351741/?channel=generic-4-f733d8522327edf87b4d1651e6395a6cca0807a0&offset=0') }

  describe '#uri' do
    subject { channel.uri }

    it { is_expected.to have_attributes(query: include('offset=0')) }

    context 'when offset is given' do
      subject { channel.uri(offset: 21) }

      it { is_expected.to have_attributes(query: include('offset=21')) }
    end
  end
end
