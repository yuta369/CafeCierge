class AddWeeklyHoursToCafes < ActiveRecord::Migration[6.1]
  def change
    add_column :cafes, :monday_hours, :string
    add_column :cafes, :tuesday_hours, :string
    add_column :cafes, :wednesday_hours, :string
    add_column :cafes, :thursday_hours, :string
    add_column :cafes, :friday_hours, :string
    add_column :cafes, :saturday_hours, :string
    add_column :cafes, :sunday_hours, :string
  end
end
