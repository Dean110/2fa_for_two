# frozen_string_literal: true

require 'transmitter'

RSpec.describe Transmitter do
  let(:under_test) { Transmitter.new(client: client) }

  describe 'listens for messages from the app and sends them to the client' do
    let(:client) { double('client') }

    it 'client recieves message to send.' do
      expect(client).to receive(:post)
        .with(message: 'TESTING')

      under_test.forward_to_client(message: 'TESTING')
    end
  end
end
