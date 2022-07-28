class PlansController < ApplicationController
  before_action :move_to_signed_in

  def search
    @plans = Plan.search(params[:keyword], params[:price],params[:evaluation],params[:chat],params[:video])
    @keyword = params[:keyword]
    render "index"
  end

  def index
    @plan = Plan.new
    @users = User.joins(:plans).distinct
    @plans = @users.map { |user| user.plans.first }
  end

  def show
    @plan = Plan.find(params[:id])
    @user = User.find(@plan.user_id)
    @article = @plan.user.articles.order(created_at: :desc)
    @reviews = @user.reviews.order("created_at DESC")
    @relationship = Relationship.find_by(id: params[:id])
    @min_price = @plan.smallplans.minimum(:price)
    if @reviews.present?
      @avg_score = @reviews.average(:evaluation).present? ? @reviews.average(:evaluation).round(2) : 0
      @avg_review = @plan.user.reviews.average(:evaluation).round(2)
      @avg_score_percentage = @reviews.average(:evaluation).round(1).to_f * 100 / 5

    else
      @avg_score = 0
      @avg_score_percentage = 0
      @avg_review = 0
    end
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

  def edit
    @user = User.find(params[:id])
    @plan = @user.plans.first
    @plan.smallplans.new
  end

  def new
    @plan = Plan.new
    @plan.smallplans.new
  end

  def create
    # Rails.logger.debug(plan_params)
    @plan = Plan.new(plan_params)
    @plan.user_id = current_user.id
    @plan.smallplans.map { |smallplan| smallplan.user_id = current_user.id }
    # Rails.logger.debug(@plan.attributes)
    # Rails.logger.debug(@plan.smallplans[0].attributes)
    # Rails.logger.debug("-----")
    if @plan.save # もし保存ができたら
      logger.debug("成功")
      redirect_to user_plans_path(current_user.id) # 投稿画面に遷移
    else # できなければ
      logger.debug("失敗")
      render :new
    end
  end

  def update
    @plan = Plan.find(params[:id])
    @plan.assign_attributes(plan_params)
    @plan.user_id = current_user.id
    @plan.smallplans.map { |smallplan| smallplan.user_id = current_user.id }
    if @plan.save!
      logger.debug("成功")
      redirect_to user_plans_path(current_user.id)
    else
      logger.debug("失敗")
      render :edit
    end
  end

  def destroy
    @plan = Plan.find(params[:id])
    @plan.destroy
    redirect_to plans_path
  end

  private

  def move_to_signed_in
    unless user_signed_in?
      # サインインしていないユーザーはログインページが表示される
      redirect_to '/users/sign_in'
    end
  end

  def plan_params
    params.require(:plan)
          .permit(
            :title, :can_do, :youtube,
            :body, 
            smallplans_attributes: [:id,
                                    :plan_name, :price, :plan_detail,
                                    :video, :chat]
          )
  end
end
