class Review < ApplicationRecord
  acts_as_taggable_on :tags

  belongs_to :user
  # belongs_to :cafe
  has_many :comments

  validates :rating, presence: true
  validates :title, presence: true
  validates :content, presence: true
end
