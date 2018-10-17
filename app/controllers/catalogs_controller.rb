class CatalogsController < ApplicationController
  before_action :authenticate_user!
  def new
    @catalog = Catalog.new
  end

  def index
  end

  def show
    @catalog = Catalog.find(params[:id])
    @user = @catalog.user
  end

  def create
    @catalog = Catalog.new(catalog_params)
    @catalog.user_id = current_user.id
    @catalog.save
    redirect_to catalogs_path
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def fav1
    catalog = Catalog.find(params[:id])
    if catalog.favorited_by?(current_user)
      fav = current_user.favorites.find_by(catalog_id: catalog.id)
      fav.destroy
      render json: [catalog.id, catalog.favorites.count]
    else
      fav = current_user.favorites.new(catalog_id: catalog.id)
      fav.save
      render json: [catalog.id, catalog.favorites.count]
    end

  end

  def fav2
    catalog = Catalog.find(params[:id])
    if catalog.liked_by?(current_user)
      fav = current_user.likes.find_by(catalog_id: catalog.id)
      fav.destroy
      render json: [catalog.id, catalog.likes.count]
    else
      fav = current_user.likes.new(catalog_id: catalog.id)
      fav.save
      render json: [catalog.id, catalog.likes.count]
    end

  end

  private

  def catalog_params
    params.require(:catalog).permit(:user_id, :before_front_image, :before_side_image, :before_back_image, :order_front_image, :order_side_image, :order_back_image, :after_front_image, :after_side_image, :after_back_image, :salon, :stylist, :menu, :price, :length, :color, :comment)
  end
end
