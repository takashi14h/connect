class CatalogsController < ApplicationController
  before_action :authenticate_user!
  def new
    @catalog = Catalog.new
  end

  def index
  end

  def show
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

  private

  def catalog_params
    params.require(:catalog).permit(:user_id, :before_front_image, :before_side_image, :before_back_image, :order_front_image, :order_side_image, :order_back_image, :after_front_image, :after_side_image, :after_back_image, :salon, :stylist, :menu, :price, :length, :color, :comment)
  end
end
