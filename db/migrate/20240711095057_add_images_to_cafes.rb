class AddImagesToCafes < ActiveRecord::Migration[6.1]
  def change
    add_column :cafes, :images, :json
  end
end
