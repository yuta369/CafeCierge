class Tagging < ActsAsTaggableOn::Tagging
  validates :tag_id, presence: true
  validates :taggable_id, presence: true
  validates :taggable_type, presence: true

  belongs_to :tag
  belongs_to :taggable, polymorphic: true
  belongs_to :tagger, polymorphic: true, optional: true
end
