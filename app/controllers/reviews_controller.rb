class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @review.save
    redirect_to plan_path(@review.user)
  end

  def new
    @review = Review.new
  end

  def index
    @review = Review.new
    @user = User.find(params[:id])
  end

  def show
    @reviews = Review.all
  end

  private
    def review_params
      params.require(:review).permit(:user_id, :body,:reviewer_id, :reviewee_id, :evaluation)
    end
  
end
