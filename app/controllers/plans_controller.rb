class PlansController < ApplicationController
    def index
        @plans = Plan.all
    end

    def show
        @plan = Plan.find(params[:id])
        @user = User.find(@plan.user_id)
        @review = Review.find(params[:id])
        @reviews = @user.reviews
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

    private  # ストロングパラメーター（予期しない値を変更されてしまう脆弱性を防ぐ機能）
    def plan_params
        params.require(:plan).permit(:title, :tag, :can_do, :youtube, :body, :status, :consent).merge(user_id: current_user.id)
    end
end
