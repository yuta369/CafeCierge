class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def after_sign_in_path_for(resource)
    cafes_path # カフェ一覧ページにリダイレクト
  end

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path # ログインページにリダイレクト
  end
end
