# frozen_string_literal: true

require 'receiver'

RSpec.describe Receiver do
  it 'provides a singleton instance of Receiver' do
    aggregate_failures 'testing singleton instance creation and maintainance' do
      expect(Receiver.instance).not_to be nil
      expect(Receiver.instance).to eq(Receiver.instance)
    end
  end

  describe 'registers delegator' do
    let(:under_test) { Receiver.instance }

    let(:delegator) { double('delegator') }

    before do
      under_test.delegator = delegator
    end

    it 'and sends message to delegator object' do
      expect(delegator).to receive(:process_message)
        .with(message: 'TEST')

      under_test.receive(message: 'TEST')
    end
  end
end
