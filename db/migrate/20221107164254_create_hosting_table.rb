class CreateHostingTable < ActiveRecord::Migration[7.0]
  def change
    create_table :hostings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :properties, null: false, foreign_key: true
      t.integer :cycle
      t.integer :minimum_cycle_amount
      t.float :rate
      t.float :cleaning_fee, null: false
      t.boolean :public, default: true
      t.timestamps
    end
  end
end
