class CreatePropertyCategoriesTable < ActiveRecord::Migration[7.0]
  def change
    create_table :categories_properties do |t|
      t.references :property, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end