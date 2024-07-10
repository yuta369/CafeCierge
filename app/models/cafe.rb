class Cafe < ApplicationRecord
  acts_as_taggable_on :tags
  
  has_many :reviews
  has_many :favorites
  has_many :reservations
  
  has_many_attached :images
  
  validates :name, presence: true
  validates :address, presence: true
  validates :contact_info, presence: true
  validates :category, presence: true
  validates :price_range, presence: true
end
