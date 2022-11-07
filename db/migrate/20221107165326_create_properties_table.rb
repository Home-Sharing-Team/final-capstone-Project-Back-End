class CreatePropertiesTable < ActiveRecord::Migration[7.0]
  def change
    create_table :properties do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :description
      t.integer :quest_capacity
      t.integer :bedrooms
      t.integer :beds
      t.integer :bathrooms
      t.integer :type
      t.float :size
      t.references :address, null: false, foreign_key: true

      t.timestamps
    end
  end
end
