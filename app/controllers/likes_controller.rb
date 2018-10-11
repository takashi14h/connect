class LikesController < ApplicationController
  def create
    catalog = Catalog.find(params[:catalog_id])
    like = current_user.likes.new(catalog_id: catalog.id)
    like.save
    redirect_to root_path(catalog)
  end
  def destroy
    catalog = Catalog.find(params[:catalog_id])
    like = current_user.likes.find_by(catalog_id: catalog.id)
    like.destroy
    redirect_to root_path(catalog)
  end
end
