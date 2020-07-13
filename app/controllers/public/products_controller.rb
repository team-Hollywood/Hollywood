class Public::ProductsController < ApplicationController
  def index
    @genres = Genre.where(is_valid: true)

    if params[:genre_id]
      @products = Product.where(genre_id: params[:genre_id], is_valid: true).page(params[:page]).per(6)
    else
      @products = Product.where(is_valid: true).page(params[:page]).per(6)
    end
  end

  def show
    @product = Product.find(params[:id])
    @genres = Genre.all
    @cart_item = CartItem.new
    if params[:genre_id]
      @products = Product.where(genre_id: params[:genre_id])
    else
      @products = Product.all
    end
  end
end
