# frozen_string_literal: true

require 'message_sender'

RSpec.describe MessageSender do
  it 'provides singleton instance of MessageSender' do
    aggregate_failures 'testing singleton creation' do
      expect(MessageSender.instance).not_to be nil
      expect(MessageSender.instance).to be MessageSender.instance
    end
  end

  describe 'instance behaves like a observer pattern subject.' do
    let(:instance) { MessageSender.instance }
    let(:observer) { double('observer') }
    it 'Instance registers an observer.' do
      expect(observer).to receive(:update)
        .with(message: 'TEST')

      instance.attach(observer: observer)
      instance.send_message(message: 'TEST')
    end
  end
end
