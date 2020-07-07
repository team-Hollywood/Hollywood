class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
    @cart_items = CartItem.where(customer_id: current_customer.id)

    render action: :confirm
  end

  def thanks
  end

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    customer_id = current_customer.id
    
    # if文で@orderを作成
    # params[:address] == 1は、「ご自身の住所」をお届け先に選択したとき
    if params[:address] == "1"
      @order = Order.new
      @order.customer_id = current_customer.id
      @order.name = current_customer.lastname + current_customer.firstname
      @order.zip_code = current_customer.zip_code
      @order.address = current_customer.address
      @cart_items = @cart_items = CartItem.where(customer_id: current_customer.id)
      @cart_items.each do |cart_item|
        subtotal = cart_item.amount * (Product.find(cart_item.product_id).tax_excluded_price * 1.1)
        @cart_item.total += subtotal
      end
      @order.payment_method = params[:order][:payment_method]
      @order.save
      # params[:address] == 2は、「登録済の住所」をお届け先に選択したとき
    elsif params[:address] == "2"
      @order = Order.new
      @order.customer_id = current_customer.id
      @order.name = Address.find(params[:registered_address_id]).name
      @order.zip_code = Address.find(params[:registered_address_id]).zip_code
      @order.address = Address.find(params[:registered_address_id]).address
      @cart_items.each do |cart_item|
        subtotal = cart_item.amount * Product.find(cart_item.product_id).tax_excluded_price * 1.1
        @cart_item.total += subtotal
      end
      @order.payment_method = params[:order][:payment_method]
      @order.save
      # params[:address] == 3は、「新しい住所」をお届け先に選択したとき
    elsif params[:address] == "3"
      @order = Address.new(order_params)
      @cart_items.each do |cart_item|
        subtotal = cart_item.amount * Product.find(cart_item.product_id).tax_excluded_price * 1.1
        @cart_item.total += subtotal
      end
      @order.save
    end
    # cart_item内の商品見ながら@order_itemsを作成
    @cart_items = CartItem.where(customer_id: current_customer.id)
    total = 0
    @cart_items.each do |cart_item|
      @ordered_item = OrderedItem.new
      @ordered_item.product_id = cart_item.product_id
      @ordered_item.order_id = @order.id
      @ordered_item.amount = cart_item.amount
      @ordered_item.tax_included_price = Product.find(cart_item.product_id).tax_excluded_price * 1.1
      subtotal = @ordered_item.amount * @ordered_item.tax_included_price = Product.find(cart_item.product_id).tax_excluded_price * 1.1
      @ordered_item.save
    end
    # @orderと@order_itemをsaveしたらカート内の商品を削除
    @cart_items = CartItem.where(customer_id: current_customer.id)
    @cart_items.destroy_all
    redirect_to public_orders_thanks_path
  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :name, :zip_code, :address, :payment_method)
  end
end
