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
      @catalog.errors.full_messages.each do |message|
        flash[:alert] = message
      end
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
      @catalog.errors.full_messages.each do |message|
        flash[:alert] = message
      end
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

  def clab
    if params[:sexlab] == 'ALL'
      @catalog = Catalog.all
    else
      user = User.where(sex: params[:sexlab])
      user = user.pluck(:id)
      @catalog = Catalog.where(user_id: user)
    end
    if params[:stylelab].blank?
    else
      @catalog = @catalog.where(length: params[:stylelab])
    end
    if params[:colorlab].blank?
    else
      @catalog = @catalog.where(color: params[:colorlab])
    end
    if params[:menulab].blank?
    else
      @catalog = @catalog.where(menu: params[:menulab])
    end
    if params[:clotheslab].blank?
    else
      @fashion = Fashion.where(fashion_name: params[:clotheslab])
      @fashion = @fashion.pluck(:id)
      @f_middle = FMiddle.where(fashion_id: @fashion)
      @f_middle = @f_middle.pluck(:user_id)
      @catalog = @catalog.where(user_id: @f_middle)
    end
    if params[:agelab].blank?
    else
      age = User.where(age: params[:agelab])
      age = age.pluck(:id)
      @catalog = @catalog.where(user_id: age)
    end
    if params[:arealab].blank?
    else
      area = User.where(user_address: params[:arealab])
      area = area.pluck(:id)
      @catalog = @catalog.where(user_id: area)
    end
    if params[:pricelab].blank?
    else
      @catalog = @catalog.where(price: params[:pricelab])
    end
    @catalog = @catalog.page(params[:page]).order('impressions_count DESC').per(15)
    render partial: 'c_ranking', locals: {catalog: @catalog}
  end

  private

  def catalog_params
    params.require(:catalog).permit(:user_id, :before_front_image, :before_side_image, :before_back_image, :order_front_image, :order_side_image, :order_back_image, :after_front_image, :after_side_image, :after_back_image, :salon, :address, :stylist, :menu, :price, :length, :color, :goods, :comment)
  end
end
