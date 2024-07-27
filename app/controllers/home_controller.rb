class HomeController < ApplicationController
  def index
    @recommended_cafes = Cafe.order(created_at: :desc).limit(3)
    @latest_reviews = Review.includes(:cafe).order(created_at: :desc).limit(3)
    @popular_tags = ActsAsTaggableOn::Tag.most_used.limit(10) # Most used tags
  end

  def about; end
end
