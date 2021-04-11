# frozen_string_literal: true

# require 'twilio-ruby'
# require 'sinatra'

# post '/sms-quickstart' do
#   twiml = Twilio::TwiML::MessagingResponse.new do |r|
#     r.message(body: 'Hi Amy, thanks for texting Ben\'s computer!')
#   end

#   twiml.to_s
# end
require 'twilio-ruby'
require 'sinatra'

# send a dynamic reply to incoming text message
post '/sms-quickstart' do
  # transform request body to lowercase
  body = params['Body'].downcase

  Receiver.instance.receive_message(message: body)

  twiml.to_s
end
