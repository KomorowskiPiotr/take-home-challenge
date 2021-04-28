# frozen_string_literal: true

module CurrencyRates
  class CreateService
    def call(project_id:, base_currency:, convert_currency:)
      return fixer if fixer['error']

      CurrencyRate.create!(
        base_currency: base_currency,
        exchanger: convert_currency,
        rate: fixer.dig('rates', convert_currency),
        project_id: project_id
      )
    end

    private

    def fixer
      Fixer::HttpRequest.new.call
    end
  end
end
