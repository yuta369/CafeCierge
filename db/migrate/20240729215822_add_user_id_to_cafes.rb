class AddUserIdToCafes < ActiveRecord::Migration[6.1]
  def change
    add_column :cafes, :user_id, :integer
  end
end
