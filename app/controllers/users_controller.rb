class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:edit, :update, :destroy]
  
  def index; end

  def show
    @cafes = @user.cafes # ユーザーが投稿したカフェ一覧
    @favorite_cafes = [] # お気に入り機能がない場合は空のリスト
    @followers = [] # フォロワー機能がない場合は空のリスト
    @following = [] # フォローしている人のリストがない場合は空のリスト
  end

  def edit; end

  def update; end

  def destroy; end

  def confirm_deactivation
    @user = User.find(params[:id])
    # ユーザーがログイン中のユーザーと一致していることを確認
    if @user == current_user
      render :confirm_deactivation
    else
      redirect_to root_path, alert: 'Unauthorized access'
    end
  end

  # 退会処理
  def deactivate
    @user = User.find(params[:id])
    if @user == current_user
      @user.update(status: 'deactivated') # ステータスを 'deactivated' に変更
      sign_out_and_redirect(current_user)  # サインアウトしてDeviseのサインアップページにリダイレクト
      flash[:notice] = 'Your account has been deactivated.'
    else
      redirect_to root_path, alert: 'Unauthorized access'
    end
  end
    
    private

  def set_user
    @user = User.find(params[:id])
  end
end
