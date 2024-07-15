class Users::SessionsController < Devise::SessionsController
  def guest_sign_in
    user = User.find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "Guest User"
    end
    sign_in user
    redirect_to cafes_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  protected

  def after_sign_in_path_for(resource)
    cafes_path # ログイン後にカフェ一覧ページにリダイレクト
  end
end
