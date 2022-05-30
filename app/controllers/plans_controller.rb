class PlansController < ApplicationController
    def index
        @plans = Plan.all
    end

    def show
        @plan = Plan.find(params[:id])
        @user = User.find(@plan.user_id)
        @review = Review.find(params[:id])
        @reviews = @user.reviews
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
    end

    def new
        @plan = Plan.new
    end

    def create
        @plan = Plan.new(plan_params)
        @plan.user_id=current_user.id
        if @plan.save # もし保存ができたら
            logger.debug("成功")
            redirect_to plan_path(@plan.id)  # 投稿画面に遷移
        else  # できなければ
            logger.debug("失敗")
            logger.debug(@article.errors.full_messages)
            render :new 
        end 
    end

    def update
        begin
            #logger.debug("article_id:" + params[:article_id])
            @plan = Plan.find(params[:id])
            if @plan.update(plan_params)
                logger.debug("成功")
                redirect_to plan_path(@plan.id)
            else
                logger.debug("失敗")
                logger.debug(@article.errors.full_messages)
                render :edit
            end
        rescue => e
            logger.debug(e)
        end
    end

    def show_plan_detail
        @plan = Plan.find(params[:id])
        @user = User.find(@plan.user_id)
    end

    def contract_create
        @plan = Plan.find(params[:id])
        @user = User.find(@plan.user_id)
    end

    def contract_shop
        @plan = Plan.find(params[:id])
        @user = User.find(@plan.user_id)
    end

    private  # ストロングパラメーター（予期しない値を変更されてしまう脆弱性を防ぐ機能）
    def plan_params
        params.require(:plan).permit(:title, :tag, :can_do, :youtube, :body, :status, :consent).merge(user_id: current_user.id)
    end
end
