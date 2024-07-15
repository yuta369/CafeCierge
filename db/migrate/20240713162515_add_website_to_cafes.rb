class AddWebsiteToCafes < ActiveRecord::Migration[6.1]
  def change
    add_column :cafes, :website, :string
  end
end
