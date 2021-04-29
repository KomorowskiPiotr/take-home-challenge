# frozen_string_literal: true

module CurrencyRates
  class CreateService
    def call(base_currency:, convert_currency:)
      rate = CurrencyRate.find_by(base_currency: base_currency, exchanger: convert_currency)

      return 'CurrencyRates with those parameters already exist' unless rate.nil?
      return fixer if fixer['error']

      CurrencyRate.create!(
        base_currency: base_currency,
        exchanger: convert_currency,
        rate: fixer.dig('rates', convert_currency)
      )
    end

    private

    def fixer
      Fixer::HttpRequest.new.call
    end
  end
end
