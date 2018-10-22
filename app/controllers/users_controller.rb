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
    c = relationship.pluck(:follower_id)
    @followed = User.where(id: c).page(params[:page]).reverse_order.per(30)
  end

  def show
    @user = User.find(params[:id])
  end

  def create
  end

  def edit
    @user = User.find(params[:id])
    @f_middle = @user.f_middles.build
    @fashions = Fashion.all
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "変更が保存されました"
      redirect_to edit_user_path(@user.id)
    else
    puts @user.errors.full_messages
      flash[:notice] = "変更が保存されませんでした"
      redirect_to edit_user_path(@user.id)
    end
  end

  def destroy
  end

    private

  def user_params
    params[:user][:f_middles_attributes].delete_if{|k, v|
  v["fashion_id"] == ''
}
puts params[:user][:f_middles_attributes]
    params.require(:user).permit(:user_name, :user_key, :age, :profile_image, :address, :sex, :face, :hair_shitu, :hair_ryou, :hair_futosa, :hair_kuse, :introduce, f_middles_attributes: [:id, :user_id, :fashion_id, :_destroy])
  end
end