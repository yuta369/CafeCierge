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
    
    private

  def set_user
    @user = User.find(params[:id])
  end
end
