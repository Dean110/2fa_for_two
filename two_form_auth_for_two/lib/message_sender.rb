# frozen_string_literal: true

require 'singleton'

# Message sending singleton class to send messages to external modules.
class MessageSender
  include Singleton

  def initialize
    @observers = []
  end

  def attach(observer:)
    @observers.push(observer)
  end

  def send_message(message:)
    @observers.each { |observer| observer.update(message: message) }
  end
end
