# frozen_string_literal: true

require 'faraday'

# Client methods and constants.
class MessageClient
  SLACK_URL = 'https://hooks.slack.com/services/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'

  def initialize(http_client: FaradayWrapper)
    @http_client = http_client
  end

  def post(message:)
    @http_client.post(url: SLACK_URL, body: "{ 'text' : '#{message}' }")
  end
end
