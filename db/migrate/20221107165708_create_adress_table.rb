class CreateAdressTable < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :street , default: ""
      t.integer :number , default: 0
      t.string :city , default: ""
      t.string :country , default: ""
      t.string :zip_code , default: ""

      t.timestamps
    end
  end
end
