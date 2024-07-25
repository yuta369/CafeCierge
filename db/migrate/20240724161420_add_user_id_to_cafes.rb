class AddUserIdToCafes < ActiveRecord::Migration[6.1]
  def change
    add_column :cafes, :user_id, :integer
    add_index :cafes, :user_id
    add_foreign_key :cafes, :users
  end
end
