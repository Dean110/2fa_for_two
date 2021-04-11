# frozen_string_literal: true

# Observer to tie into the 2FA For Two application.
class MessagingObserver
  def initialize(transmitter: Transmitter.new, subject: OutgoingMessageService.get_instance)
    @transmitter = transmitter
    subject.add_observer(observer: self)
  end

  def update(message:)
    @transmitter.forward_to_client(message: message)
  end
end
