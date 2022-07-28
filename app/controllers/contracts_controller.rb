class ContractsController < ApplicationController
  def index
    @contract = Contract.new
    @plan = Plan.find(params[:plan_id])
    @user = User.find(@plan.user_id)
    @reviews = @user.reviews.order("created_at DESC")
    if @reviews.present?
      @avg_score = @reviews.average(:evaluation).present? ? @reviews.average(:evaluation).round(2) : 0
      @avg_review = @plan.user.reviews.average(:evaluation).round(2)
      @avg_score_percentage = @reviews.average(:evaluation).round(1).to_f * 100 / 5
    else
      @avg_score = 0
      @avg_score_percentage = 0
      @avg_review = 0
    end
    @min_price = @plan.smallplans.minimum(:price)
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

  def create
    @contract = Contract.new # 何を新しく保存するか指定
    @plan = Plan.find(params[:plan_id])
    @user = User.find(@plan.user_id)

    @contract.assign_attributes(
      plan_id: @plan.id,
      consultant_id: @plan.user_id,
      customer_id: current_user.id,
      user_id: @plan.user_id
    )

    if @contract.save! # もし保存ができたら
      logger.debug("成功")
      redirect_to plan_contract_path(@plan.id, @contract.id) # 投稿画面に遷移
    else # できなければ
      logger.debug("失敗")
      logger.debug(@contract.errors.full_messages)
      render :index # newに遷移
    end
  end

  def show
    @smallplan = Smallplan.find(params[:id])
    @plan = Plan.find(params[:plan_id])
    @user = User.find(@plan.user_id)
    @reviews = @user.reviews.order("created_at DESC")

    # TODO: unless よりは if を使う
    if @reviews.present?
      @avg_score = @reviews.average(:evaluation).present? ? @reviews.average(:evaluation).round(2) : 0
      @avg_review = @plan.user.reviews.average(:evaluation).round(2)
      @avg_score_percentage = @reviews.average(:evaluation).round(1).to_f * 100 / 5
    else
      @avg_score = 0
      @avg_score_percentage = 0
      @avg_review = 0
    end
    @min_price = @plan.smallplans.minimum(:price)
    @current_entry = Entry.where(user_id: current_user.id)
    @another_entry = Entry.where(user_id: @user.id)
    @room = Room.new
    # TODO: unless よりは if を使う
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
end
