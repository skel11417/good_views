class ReviewsController < ApplicationController
  def create
    Review.create(review_params)
  end

  private

  def review_params
    params.require(:review).permit(:user_id, :movie_id, :rating, :content, :rank)
  end

end
