class FavoritesController < ApplicationController
  def index
  end
  def create
    catalog = Catalog.find(params[:catalog_id])
    favorite = current_user.favorites.new(catalog_id: catalog.id)
    favorite.save
    redirect_to root_path(catalog)
  end
  def destroy
    catalog = Catalog.find(params[:catalog_id])
    favorite = current_user.favorites.find_by(catalog_id: catalog.id)
    favorite.destroy
    redirect_to root_path(catalog)
  end
end
