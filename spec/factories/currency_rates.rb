# frozen_string_literal: true

FactoryBot.define do
  factory :currency_rate do
    base_currency { 'EUR' }
    exchanger { 'USD' }
    rate { 1.21 }
  end
end
