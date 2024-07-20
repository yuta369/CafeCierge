class ReviewsController < ApplicationController
  def edit; end

  def create
    @cafe = Cafe.find(params[:cafe_id])
    @review = @cafe.reviews.build(review_params)
    @review.user = current_user

    if @review.save
      redirect_to @cafe, notice: 'レビューが投稿されました。'
    else
      @reviews = @cafe.reviews
      render 'cafes/show'
    end
  end

  def update; end

  def destroy; end
    
  private

  def review_params
    params.require(:review).permit(:title, :content, :rating)
  end
end
