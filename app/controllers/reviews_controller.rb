class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.reviews.new(review_params)
    @review.user = current_user
    @review.save ? review_created : review_error
  end

  private

  def review_created
    redirect_to @restaurant
    flash[:notice] = "Review has been successfully added."
  end

  def review_error
    redirect_to @restaurant
    flash[:danger] = "#{@review.errors.full_messages.first}"
  end

  def review_params
    params[:review].permit(:body)
  end
end
