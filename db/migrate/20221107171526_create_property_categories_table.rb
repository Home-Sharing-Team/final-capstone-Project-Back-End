class CreatePropertyCategoriesTable < ActiveRecord::Migration[7.0]
  def change
    create_table :property_categories do |t|
      t.references :property, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
