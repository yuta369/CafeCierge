class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :cafe

  validates :user_id, presence: true
  validates :cafe_id, presence: true
end
