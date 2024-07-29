class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_review, only: [:show, :edit, :update, :destroy, :confirm_delete]
  before_action :set_cafe
  def edit; end

  def create
    @review = @cafe.reviews.build(review_params)
    @review.user = current_user # レビューのユーザーを現在ログインしているユーザーに設定

    if @review.save
      redirect_to @cafe, notice: 'レビューが投稿されました。'
    else
      render 'cafes/show'
    end
  end

  def update
    if @review.update(review_params)
      redirect_to @cafe, notice: 'レビューが更新されました。'
    else
      render :edit
    end
  end

  def destroy
    cafe = @review.cafe
    @review.destroy
    redirect_to cafe_path(cafe), notice: 'レビューが削除されました。'
  end

  def confirm_delete; end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def set_cafe
    @cafe = Cafe.find(params[:cafe_id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, alert: '指定されたカフェが見つかりません。'
  end

  def review_params
    params.require(:review).permit(:rating, :title, :content)
  end
end
