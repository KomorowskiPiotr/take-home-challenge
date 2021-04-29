# frozen_string_literal: true

class CurrencyRateEntity < BaseEntity
  expose :base_currency
  expose :exchanger
  expose :rate
end
