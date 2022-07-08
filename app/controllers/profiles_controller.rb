class ProfilesController < ApplicationController
  before_action :set_user, only: [:edit, :update]

  def index
    @user = User.find(params[:user_id])
    @relation = Relationship.find_by(following_id: @user.id, follower_id: current_user.id)
    @article = @user.articles.order(created_at: :desc)
    @review = @user.reviews.order(created_at: :desc)
    @plan = @user.plans.order(created_at: :desc)
    @avg_score = Review.average(:evaluation).round(1)
    @avg_score_percentage = Review.average(:evaluation).round(1).to_f * 100 / 5
    @user = User.find_by(id: params[:user_id])
    @sum_total_consultants = @user.contracts.where(consultant_id: @user.id).count
    @sum_total_customers = @user.contracts.where(customer_id: @user.id).count
    @current_entry = Entry.where(user_id: current_user.id)
    @another_entry = Entry.where(user_id: @user.id)
    @room = Room.new
    unless @user.id == current_user.id
      @current_entry.each do |current|
        @another_entry.each do |another|
          if current.room_id == another.room_id
            @is_room = true
            @room_id = current.room_id
          end
        end
      end
      unless @is_room
        @room = Room.new
        @entry = Entry.new
      end
    end
  end

  def set_user
    @user = User.find(current_user.id)
  end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to profile_path
      render :edit
    end
  end

  def show
    if @reviews.present?
      @avg_score = @reviews.average(:evaluation).present? ? @reviews.average(:evaluation).round(2) : 0
    else
      @avg_score = 0
      @avg_score_percentage = 0
    end
    @sum_total_consultants = current_user.contracts.where(consultant_id: current_user.id).count
    @sum_total_customers = current_user.contracts.where(customer_id: current_user.id).count
    @user = User.find(current_user.id)
    @article = @user.articles.order(created_at: :desc)
    @review = @user.reviews.order(created_at: :desc)
    @plan = @user.plans.order(created_at: :desc)
  end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :avater, :avater_cash)
  end
end
