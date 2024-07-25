class Users::RegistrationsController < Devise::RegistrationsController
  private

  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :profile_image, :introduction, :phone_number, :notification_preferences)
  end

  def account_update_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password, :profile_image, :introduction, :phone_number, :notification_preferences)
  end
  
  def after_update_path_for(resource)
    user_path(resource) # My Pageへのパス
  end
end
