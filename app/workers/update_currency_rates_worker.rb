# frozen_string_literal: true

class UpdateCurrencyRatesWorker
  include Sidekiq::Worker

  def perform
    CurrencyRates::UpdateAllService.new.call
  end
end
