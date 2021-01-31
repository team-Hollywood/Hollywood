class Admins::ProductsController < ApplicationController
   before_action :authenticate_admin!

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admins_product_path(@product), notice: "新しい商品を追加しました！"
    else
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to admins_product_path(@product), notice: "商品内容を変更しました！"
    else
      render :edit
    end
  end

  private
  def product_params
      params.require(:product).permit( :genre_id, :is_valid, :name, :tax_excluded_price, :discription, :image )
  end

end
