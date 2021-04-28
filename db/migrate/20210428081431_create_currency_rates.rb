class CreateCurrencyRates < ActiveRecord::Migration[6.1]
  def change
    create_table :currency_rates do |t|
      t.string :base_currency, null: false
      t.json :rates, default: {}
      t.belongs_to :project, index: true, foreigh_key: true
      
      t.timestamps
    end
  end
end
