# frozen_string_literal: true

FactoryBot.define do
  factory :currency_rate do
    base_currency { 'USD' }
    rates { { EUR: 1.21 } }
    association :project
  end
end
