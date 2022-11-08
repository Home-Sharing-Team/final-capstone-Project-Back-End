class CreateHostingsTable < ActiveRecord::Migration[7.0]
  def change
    create_table :hostings do |t|
      t.integer :cycle, null: false
      t.integer :minimum_cycle_amount, null: false
      t.float :rate, null: false
      t.boolean :public, null: false, default: true
      t.float :cleaning_fee
      
      t.references :user, null: false, foreign_key: true
      t.references :properties, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end