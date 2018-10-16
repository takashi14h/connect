class UsersController < ApplicationController
  def toukou
    @user = User.find(params[:id])
    @catalogs = @user.catalogs.page(params[:page]).reverse_order.per(15)
  end

  def okini
    @user = User.find(params[:id])
    favorite = @user.favorites
    a = favorite.pluck(:catalog_id)
    @catalogs = Catalog.where(id: a).page(params[:page]).reverse_order.per(15)
  end

  def follower
    @user = User.find(params[:id])
    relationship = Relationship.where(follower_id: @user.id)
    b = relationship.pluck(:followed_id)
    @follower = User.where(id: b).page(params[:page]).reverse_order.per(30)
  end

  def followed
    @user = User.find(params[:id])
    relationship = Relationship.where(followed_id: @user.id)
    b = relationship.pluck(:follower_id)
    @followed = User.where(id: b).page(params[:page]).reverse_order.per(30)
  end

  def show
    @user = User.find(params[:id])
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
