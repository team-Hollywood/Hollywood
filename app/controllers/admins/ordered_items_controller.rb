class Admins::OrderedItemsController < ApplicationController
   before_action :authenticate_admin!

  def update
  	@ordered_item = Ordered_items.find(params[:id])
  	if @ordered_items.update(ordered_items_params)
  		redirect_to admins_orders_path
  	else
  		render 'orders/show'
  	end
  end
  private
	def ordered_items_params
	  params.require(:ordered_items).permit(:production_status)
	end
end
