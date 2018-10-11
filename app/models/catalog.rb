class Catalog < ApplicationRecord
	belongs_to :user
	attachment :before_front_image
	attachment :before_side_image
	attachment :before_back_image
	attachment :order_front_image
	attachment :order_side_image
	attachment :order_back_image
	attachment :after_front_image
	attachment :after_side_image
	attachment :after_back_image
    has_many :favorites, dependent: :destroy
    has_many :likes, dependent: :destroy
    
    def favorited_by?(user)
      favorites.where(user_id: user.id).exists?
    end

    def liked_by?(user)
      likes.where(user_id: user.id).exists?
    end
end
