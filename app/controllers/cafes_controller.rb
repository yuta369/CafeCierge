class CafesController < ApplicationController
  def index; end

  def show; end

  def new
    @cafe = Cafe.new
  end

  def edit; end

  def create
    @cafe = Cafe.new(cafe_params)
    if @cafe.save
      redirect_to cafes_path, notice: 'カフェが投稿されました。'
    else
      render :new
    end
  end

  def update; end

  def destroy; end
    
  private

  def cafe_params
    params.require(:cafe).permit(:name, :address, :contact_info, :hours, :category, :price_range, :features, images: [])
  end
end
