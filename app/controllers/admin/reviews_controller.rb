class Admin::ReviewsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  def index
    @reviews = if params[:search].present?
                 Review.joins(:cafe, :user)
                       .where('reviews.title LIKE ? OR reviews.content LIKE ? OR cafes.name LIKE ? OR users.name LIKE ?', "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%")
                       .page(params[:page]).per(10)
               else
                 Review.all.page(params[:page]).per(10)
               end
  end

  def show
  end

  def edit
  end

  def update
    if @review.update(review_params)
      flash[:notice] = 'レビューが更新されました。'
      redirect_to admin_review_path(@review)
    else
      flash[:alert] = 'レビューの更新に失敗しました。'
      render :edit
    end
  end

  def destroy
    @review.destroy
    flash[:notice] = 'レビューが削除されました。'
    redirect_to admin_reviews_path
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:title, :content, :rating)
  end
end
