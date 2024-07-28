class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_user, only: [:edit, :update]
  
  def index
    @users = User.all
    if params[:query].present?
      @users = @users.where('name LIKE ? OR email LIKE ?', "%#{params[:query]}%", "%#{params[:query]}%")
    end
    @users = @users.page(params[:page]).per(10)
  end
  
  def edit
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_users_path, notice: 'ユーザーのステータスが更新されました。'
    else
      render :index
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "success"
    redirect_to admin_users_path
  end
  
  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :status)
  end
end
