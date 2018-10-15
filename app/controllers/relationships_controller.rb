class RelationshipsController < ApplicationController
  def follow
  	user = User.find(params[:id])
  	if current_user.following?(user)
  		current_user.unfollow!(user)
  	else
  		current_user.follow!(user)
  	end
    render partial: 'relationships/user', locals: {user: user}
  end
end
