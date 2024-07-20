class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cafe

  def create
    favorite = current_user.favorites.new(cafe: @cafe)
    if favorite.save
      respond_to do |format|
        format.html { redirect_to @cafe, notice: 'カフェをお気に入りに追加しました。' }
        format.js
      end
    else
      respond_to do |format|
        format.html { redirect_to @cafe, alert: 'お気に入りに追加できませんでした。' }
        format.js
      end
    end
  end

  def destroy
    favorite = current_user.favorites.find_by(cafe: @cafe)
    if favorite.destroy
      respond_to do |format|
        format.html { redirect_to @cafe, notice: 'カフェをお気に入りから削除しました。' }
        format.js
      end
    else
      respond_to do |format|
        format.html { redirect_to @cafe, alert: 'お気に入りから削除できませんでした。' }
        format.js
      end
    end
  end

  private

  def set_cafe
    @cafe = Cafe.find(params[:id])
  end
end
