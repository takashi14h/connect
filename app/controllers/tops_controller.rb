class TopsController < ApplicationController
  def top
  	@catalogs = Catalog.page(params[:page]).reverse_order.per(15)
  end
end
