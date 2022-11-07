class CreateReservationTable < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :hosting, null: false, foreign_key: true
      t.integer :quests
      t.date :check_in
      t.date :check_out
      t.float :price

      t.timestamps
    end
  end
end
