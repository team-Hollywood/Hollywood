class Public::AddressesController < ApplicationController
  before_action :authenticate_customer!
  def index
    @addresses = current_customer.addresses
    @address = Address.new
  end

  def create
    address = Address.new(address_params)
    address.customer_id = current_customer.id
    if address.save
       redirect_to public_addresses_path, notice: "新しい配送先を追加しました。"
    else
       render "index"
    end
  end

  def edit
    @address = Address.find(params[:id])
    if @address.customer_id != current_customer.id
      redirect_to public_addresses_path
    end
  end

  def update
    address = Address.find(params[:id])
    address.update(address_params)
    redirect_to public_addresses_path, notice: "配送先情報を変更しました。"
  end

  def destroy
    address = Address.find(params[:id])
    address.destroy
    redirect_to public_addresses_path, notice: "配送先を削除しました。"
  end

  private
  def address_params
    params.require(:address).permit(:customer_id, :name, :zip_code, :address)
  end

end
