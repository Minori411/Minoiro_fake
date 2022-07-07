class PlansController < ApplicationController
  before_action :move_to_signed_in

  def search
    @plans = Plan.search(params[:keyword])
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
    @plan = Plan.find(params[:id])
    @plan.smallplans.new
  end

  def new
    @plan = Plan.new
    @plan.smallplans.new
  end

  def create
    @plan = Plan.new(plan_params)
    @plan.user_id = current_user.id
    if @plan.save # もし保存ができたら
      logger.debug("成功")
      redirect_to user_plans_path(@plan.id) # 投稿画面に遷移
    else # できなければ
      logger.debug("失敗")
      logger.debug(@article.errors.full_messages)
      render :new
    end
  end

  def update
    # logger.debug("article_id:" + params[:article_id])
    @plan = Plan.find(params[:id])
    if @plan.update!(plan_params)
      logger.debug("成功")
      redirect_to user_plans_path(@plan.id)
    else
      logger.debug("失敗")
      logger.debug(@article.errors.full_messages)
      render :edit
    end
  rescue StandardError => e
    logger.debug(e)
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
            :body, :status, :consent,
            smallplans_attributes: [:id,
                                    :plan_name, :price, :plan_detail,
                                    :video, :chat].deep_merge(user_id: current_user.id)
          ).merge(user_id: current_user.id)
  end
end
