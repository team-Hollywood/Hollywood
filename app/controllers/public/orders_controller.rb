class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  def new
    @order = Order.new
    @address = Address.where(customer_id: current_customer.id)
  end

  def confirm
    @cart_items = CartItem.where(customer_id: current_customer.id)

    @order = Order.new(order_params)
    @address = Address.find_by(id: params[:registered_address_id])


  end

  def create

    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @cart_items = CartItem.where(customer_id: current_customer.id)
    if @order.save

      @cart_items.each do |cart_item|
        @ordered_item = OrderedItem.new
        @ordered_item.product_id = cart_item.product_id
        @ordered_item.order_id = @order.id
        @ordered_item.amount = cart_item.amount
        @ordered_item.tax_included_price = (cart_item.product.tax_excluded_price * 1.1)
        @ordered_item.save
      end
      # @orderと@order_itemをsaveしたらカート内の商品を削除
      @cart_items.destroy_all
      redirect_to public_orders_thanks_path
    else
        redirect_to new_public_order_path, notice: "配送先をお選びください。注文は未完了です。"
    end

  end

  def thanks
  end

  def index
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
    if @order.customer_id != current_customer.id
      redirect_to public_orders_path
    end
  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :name, :zip_code, :address, :payment_method, :total)
  end


end
