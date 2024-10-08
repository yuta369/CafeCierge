class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def github
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication # この行が実行されるとDeviseは自動的にフラッシュメッセージを表示します
      set_flash_message(:notice, :success, kind: "GitHub") if is_navigational_format?
    else
      session["devise.github_data"] = request.env["omniauth.auth"].except("extra") # "extra"が含まれるとセッションのデータサイズが増える
      redirect_to new_user_registration_url
    end
  end

  def failure
    redirect_to root_path
  end
end
