class CreateCaves < ActiveRecord::Migration[6.1]
  def change
    create_table :caves do |t|
      t.string :name
      t.string :address
      t.string :contact_info
      t.string :hours
      t.string :category
      t.string :price_range
      t.text :features

      t.timestamps
    end
  end
end
