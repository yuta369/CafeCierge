class ApplicationController < ActionController::Base
  before_action :check_user_status
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def check_user_status
    if user_signed_in? && current_user.status == 'inactive'
      sign_out_and_redirect(current_user)
      flash[:alert] = 'アカウントが退会されています。'
    end
  end
end
