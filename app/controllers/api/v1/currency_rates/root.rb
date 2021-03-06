# frozen_string_literal: true

module Api
  module V1
    module CurrencyRates
      class Root < Api::Base
        namespace 'currency_rates' do
          mount Show
          mount Exchange
        end
      end
    end
  end
end
