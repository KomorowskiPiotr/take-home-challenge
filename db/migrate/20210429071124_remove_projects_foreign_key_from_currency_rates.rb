class RemoveProjectsForeignKeyFromCurrencyRates < ActiveRecord::Migration[6.1]
  def change
    remove_reference :currency_rates, :project, index:true
  end
end
