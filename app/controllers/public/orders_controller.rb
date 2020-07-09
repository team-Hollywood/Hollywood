class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @address = Address.where(customer_id: current_customer.id)
  end

  def confirm
    @cart_items = CartItem.where(customer_id: current_customer.id)

    payment = params[:payment]
    if  payment == "0"
      @payment = "クレジットカード"
    else
      @payment = "銀行振り込み"
    end

    @choice = params[:address]
    if @choice == "1"
      @address = current_customer
    elsif @choice  == "2"
      @address = Address.find_by(id: params[:registered_address_id])
    elsif @choice == "3"
      @order = Order.new(order_params)
    end
  end

  def create
    # if文で@orderを作成
    # params[:address] == 1は、「ご自身の住所」をお届け先に選択したとき
    if @choice == "1"
      @order = Order.new
      @order.customer_id = current_customer.id
      @order.name = current_customer.lastname + current_customer.firstname
      @order.zip_code = current_customer.zip_code
      @order.address = current_customer.address
      @cart_items = @cart_items = CartItem.where(customer_id: current_customer.id)
      @cart_items.each do |cart_item|
        subtotal = cart_item.amount * (cart_item.product.tax_excluded_price * 1.1)
        @cart_item.total += subtotal
      end
      if @payment == "0"
        @order.payment_method == 0
      elsif
        @order.payment_method == 1
      end
      @order.save
      # params[:address] == 2は、「登録済の住所」をお届け先に選択したとき
    elsif @choice == "2"
      @order = Order.new
      @order.customer_id = current_customer.id
      @order.name = Address.find(params[:registered_address_id]).name
      @order.zip_code = Address.find(params[:registered_address_id]).zip_code
      @order.address = Address.find(params[:registered_address_id]).address
      @cart_items.each do |cart_item|
        subtotal = cart_item.amount * (cart_item.product.tax_excluded_price * 1.1)
        @cart_item.total += subtotal
      end
      if @payment == "0"
        @order.payment_method == 0
      elsif
        @order.payment_method == 1
      end
      @order.save
      # params[:address] == 3は、「新しい住所」をお届け先に選択したとき
    elsif @choice == "3"
      @order = Order.new(order_params)
      @cart_items.each do |cart_item|
        subtotal = cart_item.amount * (cart_item.product.tax_excluded_price * 1.1)
        @cart_item.total += subtotal
      end
      if @payment == "0"
        @order.payment_method == 0
      elsif
        @order.payment_method == 1
      end
      @order.savaa
    end
    # cart_item内の商品見ながら@order_itemsを作成
    # @cart_items = CartItem.where(customer_id: current_customer.id)
    # total = 0
    # @cart_items.each do |cart_item|
    #   @ordered_item = OrderedItem.new
    #   @ordered_item.product_id = cart_item.product_id
    #   @ordered_item.order_id = @order.id
    #   @ordered_item.amount = cart_item.amount
    #   @ordered_item.tax_included_price = (cart_item.product.tax_excluded_price * 1.1)
    #   subtotal = @ordered_item.amount * @ordered_item.tax_included_price = Product.find(cart_item.product_id).tax_excluded_price * 1.1
    #   @ordered_item.save
    # end
    # # @orderと@order_itemをsaveしたらカート内の商品を削除
    # @cart_items.destroy_all
    redirect_to public_orders_thanks_path
  end

  def thanks
  end

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :name, :zip_code, :address, :payment_method)
  end


end
