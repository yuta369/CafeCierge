class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_user, only: [:edit, :update, :destroy]

  def index
    @users = User.all
    @users = @users.where('name LIKE ? OR email LIKE ?', "%#{params[:query]}%", "%#{params[:query]}%") if params[:query].present?
    @users = @users.page(params[:page]).per(10)
  end

  def edit; end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = 'ユーザーのステータスが更新されました。'
    else
      flash[:alert] = 'ステータスの更新に失敗しました。'
    end
    redirect_to admin_users_path
  end

  def destroy
    if @user.update(status: 'deleted')
      flash[:notice] = 'ユーザーが削除されました。'
    else
      flash[:alert] = 'ユーザーの削除に失敗しました。'
    end
    redirect_to admin_users_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :introduction, :profile_image, :status)
  end
end
