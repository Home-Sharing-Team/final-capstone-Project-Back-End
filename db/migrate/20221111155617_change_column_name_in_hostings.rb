class ChangeColumnNameInHostings < ActiveRecord::Migration[7.0]
  def change
    rename_column :hostings, :properties_id, :property_id
  end
end
