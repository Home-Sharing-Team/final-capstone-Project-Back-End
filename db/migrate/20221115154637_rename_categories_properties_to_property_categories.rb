class RenameCategoriesPropertiesToPropertyCategories < ActiveRecord::Migration[7.0]
  def change
    rename_table :categories_properties, :property_categories
  end
end
