class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!
  
  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @cart_item.save
    redirect_to public_cart_items_path, notice: "カートに商品を追加しました"
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to public_cart_items_path, notice: "商品の注文数量を変更しました"
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to public_cart_items_path, notice: "カート内の商品を削除しました"
  end

  def destroy_all
    @cart_items = CartItem.where(customer_id: current_customer.id)
    @cart_items.destroy_all
    redirect_to public_cart_items_path, notice: "カート内の商品をすべて削除しました"
  end

  def index
    @cart_items = CartItem.where(customer_id: current_customer.id)

  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:amount, :product_id)
  end

end
