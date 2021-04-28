class ChangeCurrencyRate < ActiveRecord::Migration[6.1]
  def change
    add_column :currency_rates, :rate, :decimal, null: false
    remove_column :currency_rates, :rates 
    add_column :currency_rates, :exchanger, :string, null: false
  end
end
