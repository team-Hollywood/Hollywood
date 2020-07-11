class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  protected
  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_a?(Admin)
      admins_homes_top_path
    else
      root_path
    end
  end

  #sign_out後のredirect先変更する。rootパスへ。rootパスはhome topを設定済み。
  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :admin
      new_admin_session_path
    else
      root_path
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:lastname, :firstname, :lastname_kana, :firstname_kana, :zip_code, :address, :phone])
  end
end
