class Public::OrdersController < ApplicationController
  def new
  end

  def confirm
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
  end
end
