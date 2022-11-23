class CreatePropertiesTable < ActiveRecord::Migration[7.0]
  def change
    create_table :properties do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.integer :guest_capacity, null: false
      t.integer :bedrooms, null: false
      t.integer :beds, null: false
      t.integer :baths, null: false
      t.integer :kind, null: false, default: 0
      t.float :size, null: false
      t.boolean :is_public, null: false, default: false

      t.references :user, null: false, foreign_key: true
      t.references :address, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
