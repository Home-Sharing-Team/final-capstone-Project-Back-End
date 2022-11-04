class ChangeStatusToUser < ActiveRecord::Migration[7.0]
  def change

    change_column :user, :role, :integer, default: 0
    
  end
end
