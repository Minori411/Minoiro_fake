class PlansController < ApplicationController
  before_action :move_to_signed_in

  def search
    @plans = Plan.search(params[:keyword], params[:price], params[:evaluation], params[:chat], params[:video])
    @keyword = params[:keyword]
    render "index"
  end

  def index
    @plan = Plan.new
    @users = User.joins(:plans).distinct
    @plans = @users.map { |user| user.plans.first }
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
      redirect_to user_plans_path(current_user.id) # 投稿画面に遷移
    else # できなければ
      render :new
    end
  end

  def update
    @plan = Plan.find(params[:id])
    @plan.assign_attributes(plan_params)
    @plan.user_id = current_user.id
    @plan.smallplans.map { |smallplan| smallplan.user_id = current_user.id }
    if @plan.save!
      redirect_to user_plans_path(current_user.id)
    else
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
