class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :catalogs, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :user_key, length: { maximum: 20 }
  validates :user_key, presence: true
end
