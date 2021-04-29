# frozen_string_literal: true

module Api
  module V1
    module CurrencyRates
      class Show < Api::Base
        get do
          params do
            requires :api_key, type: String
          end

          project = Project.find_by(api_key: params['api_key'])
          return invalid_api_key unless project

          rates = CurrencyRate.all

          present(rates, with: ::CurrencyRateEntity)
        end
      end
    end
  end
end
