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
  	if @order.update(order_params)
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
