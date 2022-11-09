class ChangeNameToPropertyCategories < ActiveRecord::Migration[7.0]
  def change
    rename_table :property_categories, :categories_properties 
  end
end
