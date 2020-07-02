class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected
  def after_sign_in_path_for(resource)
    if customer_signed_in?
      public_products_path
    elsif admin_signed_in?
      admins_homes_top_path
    end
  end

  #sign_out後のredirect先変更する。rootパスへ。rootパスはhome topを設定済み。
  def after_sign_out_path_for(resource)
    root_path
  end
end
