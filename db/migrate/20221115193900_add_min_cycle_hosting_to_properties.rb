class AddMinCycleHostingToProperties < ActiveRecord::Migration[7.0]
  def change
    add_reference :properties, :min_cycle_hosting, foreign_key: { to_table: 'hostings' }
  end
end
