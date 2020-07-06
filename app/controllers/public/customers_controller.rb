class Public::CustomersController < ApplicationController
  def show
  end

  def edit
  end

  def update
    customer = current_customer
    if customer.update(customer_params)
      redirect_to public_customers_path(customer), notice: "you successfully updated customer"
    else
      render :edit
    end
  end

  def unsubscribe
  end

  def hide
      customer = current_customer
      #is_deletedカラムにフラグを立てる(defaultはfalse)
      customer.update(is_registered: false)
      #ログアウトさせる
      reset_session
      flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
      redirect_to root_path
  end

  private
  def customer_params
    params.require(:customer).permit(:lastname, :firstname, :lastname_kana, :firstname_kana, :zip_code, :address, :phone, :email, :is_registered)
  end
end
