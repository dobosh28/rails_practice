class ChangeUserModel < ActiveRecord::Migration[7.0]
  def change

    # Remove name and email columns
    remove_column :users, :name
    remove_column :users, :email

    # Add username column
    add_column :users, :username, :string, null: false

    # Add index on username column for faster lookups and ensure uniqueness at DB level 
    add_index :users, :username, unique: true
  end
end
