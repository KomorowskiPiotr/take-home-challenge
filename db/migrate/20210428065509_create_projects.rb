class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :api_key, null: false
      
      t.timestamps
    end
  end
end
