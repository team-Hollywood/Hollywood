class Admins::OrdersController < ApplicationController
   before_action :authenticate_admin!

  def index
  	@orders = Order.all
  end

  def show
  	@order = Order.find(params[:id])
  end

  def update
  	@order = Order.find(params[:id])
    @order.update(order_params)
    @ordered_item = @order.ordered_items
  	if @order.order_status == "入金確認"
      @ordered_item.update(production_status: 1)
  		redirect_to admins_orders_path
  	else
  		render :show
  	end
  end


  private
	def order_params
	  params.require(:order).permit(:order_status)
	end
end
