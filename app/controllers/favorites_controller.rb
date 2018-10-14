class FavoritesController < ApplicationController
  def index
  end
  def create
    @favorite = Favorite.create(user_id: current_user.id, catalog_id: params[:catalog_id])
    @catalogs = Catalog.find(params[:catalog_id])
    @favorite_count = @catalogs.favorites.count

  end
  def destroy
    favorite = Favorite.find_by(user_id: current_user.id, catalog_id: params[:catalog_id])
    favorite.destroy
    @catalogs = Catalog.find(params[:catalog_id])
    @favorite_count = @catalogs.favorites.count
  end
end
