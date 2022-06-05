class ContractsController < ApplicationController
  def index
    @contract = Contract.new
    @plan = Plan.find(params[:plan_id])
    @user = User.find(@plan.user_id)
    logger.debug()
  end

  def create
    @contract = Contract.new# 何を新しく保存するか指定
    @plan = Plan.find(params[:plan_id])
    @user = User.find(@plan.user_id)
    @contract.plan_id = @plan.id
    @contract.consultant_id = @plan.user_id
    @contract.customer_id = current_user.id
    @contract.user_id = current_user.id
            if @contract.save! # もし保存ができたら
                logger.debug("成功")
                redirect_to plan_contract_path(@plan.id,@contract.id) # 投稿画面に遷移
            else  # できなければ
                logger.debug("失敗")
                logger.debug(@contract.errors.full_messages)
                render :index  # newに遷移
            end
  end

  def show
    @plan = Plan.find(params[:plan_id])
    @user = User.find(@plan.user_id)
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

  
end
