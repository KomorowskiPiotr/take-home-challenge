# frozen_string_literal: true

class ProjectEntity < BaseEntity
  expose :name
  expose :api_key
  expose :currency_rates, using: CurrencyRateEntity
end
