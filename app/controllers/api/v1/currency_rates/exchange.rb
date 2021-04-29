# frozen_string_literal: true

module Api
  module V1
    module CurrencyRates
      class Exchange < Api::Base
        get '/exchange' do
          params do
            requires :api_key, type: String
            requires :exchanger, type: String
            requires :value, type: Float
          end

          project = Project.find_by(api_key: params['api_key'])
          return invalid_api_key unless project

          currency_rate = CurrencyRate.find_by(exchanger: params['exchanger'])
          return not_found unless currency_rate

          { exchange_value: (currency_rate.rate * params['value'].to_f) }
        end
      end
    end
  end
end
