class AddProfileFieldsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :introduction, :text
    add_column :users, :phone_number, :string
    add_column :users, :notification_preferences, :text
  end
end
