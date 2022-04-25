class ReviewsController < ApplicationController
  def new
  end

  def index
  end

  def show
    @reviews = Review.all
  end

  
end
