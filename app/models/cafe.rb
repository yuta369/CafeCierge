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

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  
  def written_by?(current_user)
    user == current_user 
  end
  
  def review_avarage
    reviews.average(:rating).to_f.round(1)
  end
  
  # Café検索機能
  def self.search_by_tag_name(params)
    
    if params[:name].present? && params[:tag].present?
      tag = Tag.find(params[:tag])
       tagged_with(tag.name).where("name LIKE ?", "%#{params[:name]}%")
    elsif params[:name].present?
      where("name LIKE ?", "%#{params[:name]}%")
    elsif params[:tag].present?
      tag = Tag.find(params[:tag])
       tagged_with(tag.name)
    else
      all
    end.page(params[:page]).per(10)

  end

end