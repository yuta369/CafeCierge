class CafesController < ApplicationController
  before_action :set_cafe, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    if params[:name].present? && params[:tag].present?
      tag = Tag.find(params[:tag])
      @cafes = Cafe.tagged_with(tag.name).where("name LIKE ?","%#{params[:name]}%").page(params[:page]).per(10)
    elsif params[:name].present?
      @cafes = Cafe.where("name LIKE ?","%#{params[:name]}%").page(params[:page]).per(10)
    elsif params[:tag].present?
      tag = Tag.find(params[:tag])
      @cafes = Cafe.tagged_with(tag.name).page(params[:page]).per(10)
    else
      @cafes = Cafe.all.page(params[:page]).per(10)
    end
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
    @cafe.user = current_user # カフェの作成者を設定
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
    @cafe.destroy
    redirect_to cafes_url, notice: 'カフェが削除されました。'
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
      { tag_list: [] },
      reviews_attributes: [:rating, :title, :content]
    )
  end
end