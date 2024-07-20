class CreateCafes < ActiveRecord::Migration[6.1]
  def change
    create_table :cafes do |t|
      t.string :name
      t.string :address
      t.string :contact_info
      t.string :website
      t.string :hours
      t.string :category
      t.string :price_range
      t.text :features
      t.string :review_title
      t.text :review_content
      t.float :cafe_rating
      t.json :images

      t.timestamps
    end
  end
end
