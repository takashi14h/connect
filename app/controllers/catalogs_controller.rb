class CatalogsController < ApplicationController
  before_action :authenticate_user!
  impressionist :actions=> [:show]
  def new
    @catalog = Catalog.new
  end

  def index
    a = Relationship.group(:followed_id).order('count(follower_id) desc').limit(5).pluck(:followed_id)
    @users = User.where(id: a)
    @catalog = Catalog.page(params[:page]).order('impressions_count DESC').per(15)
  end

  def show
    @catalog = Catalog.find(params[:id])
    @user = @catalog.user
    impressionist(@catalog, nil, unique: [:session_hash])
  end

  def create
    @catalog = Catalog.new(catalog_params)
    @catalog.user_id = current_user.id
    if @catalog.save
      redirect_to catalog_path(@catalog.id)
    else
      puts @catalog.errors.full_messages
      flash[:alert] = "変更できませんでした"
      redirect_to new_catalog_path
    end
  end

  def edit
    @catalog = Catalog.find(params[:id])
  end

  def update
    @catalog = Catalog.find(params[:id])
    if @catalog.update(catalog_params)
      redirect_to catalog_path(@catalog.id)
    else
      flash[:alert] = "変更できませんでした"
      redirect_to edit_catalog_path(@catalog.id)
    end
  end

  def destroy
    catalog = Catalog.find(params[:id])
    catalog.destroy
    redirect_to users_toukou_path(current_user.id)
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
    params.require(:catalog).permit(:user_id, :before_front_image, :before_side_image, :before_back_image, :order_front_image, :order_side_image, :order_back_image, :after_front_image, :after_side_image, :after_back_image, :salon, :address, :stylist, :menu, :price, :length, :color, :goods, :comment)
  end
end
