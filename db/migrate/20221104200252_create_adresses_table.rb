class CreateAdressesTable < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :street, null: false
      t.integer :number, null: false
      t.string :city, null: false
      t.string :country, null: false
      t.string :zip_code, null: false
      t.string :continent, null: false

      t.timestamps
    end
  end
end
