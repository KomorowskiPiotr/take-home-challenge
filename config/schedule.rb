every 1.hour do
  runner "UpdateCurrencyRatesWorker.perform_async"
end
