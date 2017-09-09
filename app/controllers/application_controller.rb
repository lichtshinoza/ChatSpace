class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :flash_notice_override

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def flash_notice_override
    if flash[:notice] == "ログアウトしました"
      flash.delete(:notice)
      flash[:alert] = "ログアウトしました"
    end
  end

  def after_sign_out_path_for(resource)
    '/users/sign_in'
  end
end
