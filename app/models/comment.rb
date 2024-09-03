class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :review

  validates :content, presence: true
end

# TODO: コメント機能の実装の準備