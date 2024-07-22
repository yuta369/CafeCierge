class ReviewsController < ApplicationController
  before_action :set_cafe
  def edit; end

  def create
    @review = @cafe.reviews.build(review_params)
    @review.user = current_user

    if @review.save
      redirect_to @cafe, notice: 'レビューが正常に投稿されました。'
    else
      render 'cafes/show'
    end
  end

  def update; end

  def destroy; end
    
  private

  def set_cafe
    @cafe = Cafe.find(params[:cafe_id])
  end

  def review_params
    params.require(:review).permit(:rating, :title, :content)
  end
end
