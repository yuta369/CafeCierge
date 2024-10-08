class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :confirm_deactivation, :deactivate]
  before_action :authenticate_user!, only: [:show, :edit, :update, :destroy, :confirm_deactivation, :deactivate]

  def index
  end

  def show
    @cafes = @user.cafes
    @favorite_cafes = []
    @followers = []
    @following = []
  end

  # 退会確認ページ
  def confirm_deactivation
    if @user == current_user
      render :confirm_deactivation
    else
      redirect_to root_path, alert: '不正なアクセスです。'
    end
  end

  # 退会処理
  def deactivate
    if @user == current_user
      @user.update(status: 'inactive')
      sign_out_and_redirect(current_user)
      flash[:notice] = 'アカウントが退会されました。'
    else
      redirect_to root_path, alert: '不正なアクセスです。'
    end
  end

  private

  def set_user
    @user = User.find_by(id: params[:id])
    if @user.nil?
      redirect_to root_path, alert: 'ユーザーが見つかりません。'
    end
  end
end
