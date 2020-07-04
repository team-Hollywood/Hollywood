class Admins::ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admins_products_path
    else
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
  end

  def update
  end

  private
  def product_params
      params.require(:product).permit( :genre_id, :is_valid, :name, :tax_excluded_price, :discription, :image )
  end
end
