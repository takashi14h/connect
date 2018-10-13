class LikesController < ApplicationController
  def create
    @like = Like.create(user_id: current_user.id, catalog_id: params[:catalog_id])
    @catalogs = Catalog.find(params[:catalog_id])
    @like_count = @catalogs.likes.count
  end
  def destroy
    like = Like.find_by(user_id: current_user.id, catalog_id: params[:catalog_id])
    like.destroy
    @catalogs = Catalog.find(params[:catalog_id])
    @like_count = @catalogs.likes.count
  end
end
