class CreateReservationsTable < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.integer :guests, null: false
      t.date :check_in, null: false
      t.date :check_out, null: false
      t.float :price, null: false
      
      t.references :user, null: false, foreign_key: true
      t.references :blocked_period, null: false, foreign_key: true
      t.references :property, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
