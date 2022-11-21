class DeleteColumnHostingId < ActiveRecord::Migration[7.0]
  def change
    remove_column :reservations, :hosting_id
  end
end
