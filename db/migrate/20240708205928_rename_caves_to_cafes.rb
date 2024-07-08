class RenameCavesToCafes < ActiveRecord::Migration[6.1]
  def change
    rename_table :caves, :cafes
  end
end
