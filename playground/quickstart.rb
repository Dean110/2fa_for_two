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
    puts params
  # Build response based on given body param
  twiml = Twilio::TwiML::MessagingResponse.new do |resp|
    if body == 'hello'
      resp.message body: 'Hi, Amy!'
    elsif body == 'bye'
      resp.message body: 'Goodbye, Amy!'        
    else
        resp.message body: 'Say hello -or- bye'
    end
  end

  twiml.to_s
end