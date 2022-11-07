class CreateAdressTable < ActiveRecord::Migration[7.0]
  def change
    create_table :adresses do |t|
      t.string :street
      t.string :number
      t.string :city
      t.string :country
      t.string :zip_code

      t.timestamps
    end
  end
end
