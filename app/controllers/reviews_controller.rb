class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    if @review.save!
      redirect_to plan_path(@review.user)
    end
  end

  def new
    @review = Review.new
    @plan = Plan.find params[:plan_id]
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
      params.require(:review).permit(:user_id, :body, :reviewee_id, :evaluation).merge(reviewer_id: current_user.id, reviewee_id: params[:review][:user_id])
    end
  
end
