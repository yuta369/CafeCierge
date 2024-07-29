class Cafe < ApplicationRecord
  acts_as_taggable_on :tags
  serialize :features, Array

  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorited_by_users, through: :favorites, source: :user
  has_many :reservations
  has_many_attached :images

  belongs_to :user

  validates :name, presence: true
  validates :address, presence: true
  validates :contact_info, presence: true
  validates :category, presence: true
  validates :price_range, presence: true
  validates :images, content_type: ['image/png', 'image/jpg', 'image/jpeg'],
                     size: { less_than: 5.megabytes, message: 'is not given between size' }

  accepts_nested_attributes_for :reviews

  def self.ransackable_attributes(_auth_object = nil)
    ["address", "category", "contact_info", "created_at", "features", "hours", "id", "images", "name", "price_range", "updated_at", "website", "review_title", "review_content", "rating"]
  end

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
