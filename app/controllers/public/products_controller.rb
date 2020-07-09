class Public::ProductsController < ApplicationController
  PER = 8

  def index
    @genres = Genre.all

    if params[:genre_id]
      @products = Product.where(genre_id: params[:genre_id]).page(params[:page]).per(4)
    else
      @products = Product.all.page(params[:page]).per(4)
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
