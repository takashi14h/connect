class TopsController < ApplicationController
  def top
  	@catalogs = Catalog.page(params[:page]).reverse_order.per(15)
  end

  def lab
  	puts params[:sexlab]
  	if params[:sexlab] == 'ALL'
  		@catalogs = Catalog.page(params[:page]).reverse_order.per(15)
  	else
	  	user = User.where(sex: params[:sexlab])
		user = user.pluck(:id)
		@catalogs = Catalog.where(user_id: user).page(params[:page]).reverse_order.per(15)
  	end
  	render partial: 'itiran', locals: {catalogs: @catalogs}
  end
end
