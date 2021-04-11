# frozen_string_literal: true

class Delegator
  def initialize(receiver: Receiver.instance, message_sender: MessageSender.instance)
    @message_sender = message_sender
  end

  def receive_message(message:)
    @message_sender.send_message(message: message)
  end
end
