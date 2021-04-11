# frozen_string_literal: true

require 'delegator'

RSpec.describe Delegator do
  describe 'processes message' do
    let(:under_test) { Delegator.new(receiver: receiver, message_sender: message_sender) }

    let(:receiver) { double 'receiver' }
    let(:message_sender) { double 'message_sender' }

    it 'sends to the MessageSender instance' do
      aggregate_failures 'Testing messages to dependencies' do
        expect(message_sender).to receive(:send_message)
          .with(message: 'TEST')
      end

      under_test.receive_message(message: 'TEST')
    end
  end
end
