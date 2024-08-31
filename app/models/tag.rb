class Tag < ActsAsTaggableOn::Tag
  has_many :taggings, dependent: :destroy
  
  validates :name, presence: true, uniqueness: true
end
