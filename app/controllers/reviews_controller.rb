class ReviewsController < ApplicationController
  def create
    review = Review.create(review_params)

    render json: review
  end

  def update
    review = Review.find(params[:id])
    review.update(review_params)
    render json: review
  end

  private

  def review_params
    params.require(:review).permit(:user_id, :movie_id, :rating, :content, :rank)
  end

end
