class CreateUsersTable < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :password_digest, null: false
      t.integer :role, null: false, default: 0
      t.string :avatar
      t.text :about
      t.string :native_language
      t.string :country

      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end
