# frozen_string_literal: true

require 'faraday'

# Wrapper for the Faraday HTTP Client.
module FaradayWrapper
  def self.post(url:, body:)
    Faraday.post(url, body)
  end
end
