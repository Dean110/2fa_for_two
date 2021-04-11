# frozen_string_literal: true

require 'singleton'

# Creates an singleton to be extended in to a message providing service.
class Receiver
  include Singleton

  attr_accessor :delegator

  def receive(message:)
    @delegator.process_message(message: message)
  end
end
