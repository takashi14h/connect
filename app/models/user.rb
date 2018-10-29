class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    include SearchUser

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :profile_image

  has_many :catalogs, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :f_middles, dependent: :destroy, inverse_of: :user
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed
  has_many :reverse_relationships, foreign_key: "followed_id", class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :reverse_relationships, source: :follower
  accepts_nested_attributes_for :f_middles, allow_destroy: true

  validates :user_key, length: { maximum: 20 }
  validates :user_key, presence: true

  def following?(other_user)
    # relationships.find_by(followed_id: other_user.id)
    followed_users.include?(other_user)
  end

  def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    relationships.find_by(followed_id: other_user.id).destroy
  end

  def active_for_authentication?
    !deleted_at
  end

  def inactive_message
    !deleted_at ? super : :deleted_account
  end
end
