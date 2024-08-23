class User < ApplicationRecord
  # ステータスの選択肢
  STATUSES = ['active', 'inactive', 'suspended', 'deactivated'].freeze
  validates :status, inclusion: { in: STATUSES }

  # ステータスのバリデーション
  validates :status, inclusion: { in: STATUSES }

  # プロフィール画像
  has_one_attached :profile_image

  # フォロー関係の設定
  # 自分がフォローしているユーザー
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :following, through: :active_relationships, source: :followee

  # 自分をフォローしているユーザー
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followee_id", dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :follower

  # カフェ関連
  has_many :cafes, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :comments
  has_many :favorites, dependent: :destroy
  has_many :favorite_cafes, through: :favorites, source: :cafe
  has_many :reservations

  # バリデーション
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, length: { minimum: 6 }, if: -> { new_record? || !password.nil? }
  validates :profile_image, content_type: ['image/png', 'image/jpg', 'image/jpeg'],
                            size: { less_than: 5.megabytes, message: 'is not given between size' }

  # Deviseモジュール
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[github]

  # Omniauthでのユーザー作成/検索
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name
      user.image = auth.info.image
      # user.skip_confirmation! # メール確認をスキップする場合
    end
  end

  # ゲストユーザーの作成
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "Guest User"
    end
  end

  # 管理者判定
  def admin?
    role == 'admin'
  end

  # お気に入りの管理
  def favorite(cafe)
    favorites.find_or_create_by(cafe:)
  end

  def unfavorite(cafe)
    favorites.where(cafe:).destroy_all
  end

  # フォロー機能
  def following?(other_user)
    following.include?(other_user)
  end

  def follow!(other_user)
    active_relationships.create!(followee_id: other_user.id)
  end

  def unfollow!(other_user)
    active_relationships.find_by(followee_id: other_user.id).destroy
  end
  
  def same(current_user)
    current_user == self
  end
end
