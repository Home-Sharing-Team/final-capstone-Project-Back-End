class AddBathsToProperty < ActiveRecord::Migration[7.0]
  def change
    add_column :properties, :baths, :integer, null: false
  end
end
