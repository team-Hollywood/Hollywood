class Admins::CustomersController < ApplicationController
  before_action :authenticate_admin!


  def index
  	@customers = Customer.all
  end

  def show
  	@customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to admins_customer_path(@customer), notice: "you successfully updated customer"
    else
      render :edit
    end
  end

  private
  def customer_params
    params.require(:customer).permit(:lastname, :firstname, :lastname_kana, :firstname_kana, :zip_code, :address, :phone, :email, :is_registered)
  end
end
