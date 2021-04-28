# frozen_string_literal: true

# # frozen_string_literal: true

require 'faraday'

module Fixer
  class HttpRequest
    attr_reader :endpoint

    def initialize(endpoint: 'latest')
      @endpoint = endpoint
    end

    def call
      response = faraday.post(
        "http://data.fixer.io/api/#{endpoint}?access_key=#{ENV['FIXER_API_KEY']}"
      ) do |request|
        http_logger.info(request.to_h)
      end

      JSON.parse(response.body)
    rescue Faraday::Error => e
      http_logger.error(e)
      { error: 'Error connecting to API. Please try again.' }
    rescue JSON::ParserError
      { error: 'Response cannot be parsed to JSON' }
    end

    private

    def faraday
      Faraday.new(
        url: 'http://data.fixer.io/'
      )
    end

    def http_logger
      ActiveSupport::Logger.new(Rails.root.join('log/fixer.log'))
    end
  end
end
