class Admins::OrderedItemsController < ApplicationController
   before_action :authenticate_admin!

  def update
    @ordered_item = OrderedItem.find(params[:id])
    @ordered_item.update(ordered_items_params)
    @order = Order.find(@ordered_item.order_id)
    if    @ordered_item.production_status == "製作中"
          @order.update(order_status: 2)
    end
    if  @order.ordered_items.where(production_status: 3).count == @order.ordered_items.count
        @order.update(order_status: 3)
    end
    redirect_to admins_order_path(@order.id)
  end

  private
	def ordered_items_params
	  params.require(:ordered_item).permit(:production_status)
	end

end
