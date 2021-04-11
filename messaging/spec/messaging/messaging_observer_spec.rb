# frozen_string_literal: true

require 'messaging_observer'

RSpec.describe MessagingObserver do
  let(:under_test) { MessagingObserver.new(transmitter: transmitter, subject: observed_subject) }

  let(:transmitter) { double('transmitter') }
  let(:observed_subject) { double('subject') }

  before do
    expect(observed_subject).to receive(:add_observer)
      .with(any_args)
  end

  it 'sends messages to a transmitter when it is updated.' do
    expect(transmitter).to receive(:forward_to_client)
      .with(message: 'HELLO, WORLD!')
    under_test.update(message: 'HELLO, WORLD!')
  end

  it 'registers as a observer on a subject.' do
    under_test
  end
end
