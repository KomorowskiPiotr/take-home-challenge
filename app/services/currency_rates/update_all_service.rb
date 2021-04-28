# frozen_string_literal: true

module CurrencyRates
  class UpdateAllService
    def call
      return fixer if fixer['error']

      rates = CurrencyRate.where(base_currency: 'EUR')

      rates.each do |rate|
        rate.update(rate: fixer.dig('rates', rate.exchanger))
      end
    end

    private

    def fixer
      Fixer::HttpRequest.new.call
    end
  end
end
