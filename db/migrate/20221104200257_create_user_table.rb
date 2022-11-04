class CreateUserTable < ActiveRecord::Migration[7.0]
  def change
    create_table :user do |t|
      t.string :name
      t.integer :role
      t.timestamps
  end
end
end
