class Public::HomesController < ApplicationController
  def top
  	@genres = Genre.all
  	@products = Product.page(params[:page]).reverse_order
  end
end
