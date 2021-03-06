class TopsController < ApplicationController
  def top
  	@catalogs = Catalog.page(params[:page]).reverse_order.per(15)
    a = Relationship.group(:followed_id).order('count(follower_id) desc').limit(5).pluck(:followed_id)
    @users = User.where(id: a)
    @catalog = Catalog.order('impressions_count DESC').limit(3)
  end


  def lab
  	if params[:sexlab] == 'ALL'
  		@catalogs = Catalog.all
  	else
	  	user = User.where(sex: params[:sexlab])
  		user = user.pluck(:id)
  		@catalogs = Catalog.where(user_id: user)
  	end
    if params[:stylelab].blank?
    else
      @catalogs = @catalogs.where(length: params[:stylelab])
    end
    if params[:colorlab].blank?
    else
      @catalogs = @catalogs.where(color: params[:colorlab])
    end
    if params[:menulab].blank?
    else
      @catalogs = @catalogs.where(menu: params[:menulab])
    end
    if params[:clotheslab].blank?
    else
      @fashion = Fashion.where(fashion_name: params[:clotheslab])
      @fashion = @fashion.pluck(:id)
      @f_middle = FMiddle.where(fashion_id: @fashion)
      @f_middle = @f_middle.pluck(:user_id)
      @catalogs = @catalogs.where(user_id: @f_middle)
    end
    if params[:agelab].blank?
    else
      age = User.where(age: params[:agelab])
      age = age.pluck(:id)
      @catalogs = @catalogs.where(user_id: age)
    end
    if params[:arealab].blank?
    else
      area = User.where(user_address: params[:arealab])
      area = area.pluck(:id)
      @catalogs = @catalogs.where(user_id: area)
    end
    if params[:pricelab].blank?
    else
      @catalogs = @catalogs.where(price: params[:pricelab])
    end
    @catalogs = @catalogs.page(params[:page]).reverse_order.per(15)
  	render partial: 'itiran', locals: {catalogs: @catalogs}
  end
end

