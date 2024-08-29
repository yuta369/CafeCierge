class FavoritesController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_cafe

  def create
    favorite = @cafe.favorites.new(user: current_user)
    if favorite.save!
      respond_to do |format|
        format.html { redirect_to @cafe, notice: 'お気に入りに追加しました。' }
        format.js   # create.js.erb を使用
      end
    else
      respond_to do |format|
        format.html { redirect_to @cafe, alert: 'お気に入りに追加できませんでした。' }
        format.js   # create.js.erb を使用
      end
    end
  end

  def destroy
    favorite = @cafe.favorites.find_by(user: current_user)
    if favorite&.destroy
      respond_to do |format|
        format.html { redirect_to @cafe, notice: 'お気に入りから削除しました。' }
        format.js   # destroy.js.erb を使用
      end
    else
      respond_to do |format|
        format.html { redirect_to @cafe, alert: 'お気に入りから削除できませんでした。' }
        format.js   # destroy.js.erb を使用
      end
    end
  end

  private

  def set_cafe
    @cafe = Cafe.find(params[:id])
  end
end

