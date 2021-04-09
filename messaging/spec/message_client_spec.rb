# frozen_string_literal: true

require 'message_client'

RSpec.describe MessageClient do
  describe 'can send messages to an external service' do
    let(:under_test) { MessageClient.new(http_client: http_client) }

    let(:http_client) { double('client_double') }

    it 'by sending a request to the external service client.' do
      expect(http_client).to receive(:post)
        .with(body: "{ 'text' : 'TESTING' }",
              url: MessageClient::SLACK_URL)

      under_test.post(message: 'TESTING')
    end
  end
end
