class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :cafe

  validates :reservation_date, presence: true
  validates :status, presence: true
end

# TODO: カフェ予約機能の実装の準備