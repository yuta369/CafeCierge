class CafesController < ApplicationController
  before_action :set_cafe, only: [:show, :edit, :update, :destroy]

  def index
    @q = Cafe.ransack(params[:q])
    @cafes = @q.result.includes(:reviews).order('reviews.rating DESC').page(params[:page]).per(10)
  end

  def show
    @reviews = @cafe.reviews
    @review = Review.new
  end

  def new
    @cafe = Cafe.new
    @cafe.reviews.build # レビューのビルド
  end

  def edit; end

  def create
    @cafe = Cafe.new(cafe_params)
    @cafe.reviews.first.user = current_user # レビューのユーザーを設定

    if @cafe.save
      redirect_to @cafe, notice: 'カフェが正常に作成されました。'
    else
      render :new
    end
  end

  def update
    if @cafe.update(cafe_params)
      redirect_to @cafe, notice: 'カフェが正常に更新されました。'
    else
      render :edit
    end
  end

  def destroy
    image = ActiveStorage::Attachment.find(params[:id])
    image.purge
    @cafe = Cafe.find(params[:cafe_id])
    redirect_to cafe_path(@cafe)
    @cafe.destroy
    redirect_to cafes_url, notice: 'カフェが正常に削除されました。'
  end

  private

  def set_cafe
    @cafe = Cafe.find(params[:id])
  end

  def cafe_params
    params.require(:cafe).permit(
      :name,
      :address,
      :contact_info,
      :website,
      :hours,
      :category,
      :price_range,
      { images: [] },
      { features: [] },
      :tag_list,
      reviews_attributes: [:rating, :title, :content]
    )
  end
end
