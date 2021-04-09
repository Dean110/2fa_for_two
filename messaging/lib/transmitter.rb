# frozen_string_literal: true

require 'message_client'

# Transmitter provides a class to listen  for messages from a source and send them to the client.
class Transmitter
  attr_reader :client

  def initialize(client: MessageClient.new)
    @client = client
  end

  def forward_to_client(message:)
    @client.post(message: message)
  end
end
