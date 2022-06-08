class PlansController < ApplicationController

    def search
        @plan = Plan.new
        @plans = Plan.search(params[:keyword])
        @keyword = params[:keyword]
        render "index"
    end

    def index
        @plan = Plan.new
        @plans = Plan.all
        @avg_review = Review.average(:evaluation)
        @sum_plan = Plan.count(:id)
        @min_price = Plan.minimum(:price)
    end


    def show
        @min_price = Plan.minimum(:price)
        @avg_score = Review.average(:evaluation).round(1)
        @avg_score_percentage = Review.average(:evaluation).round(1).to_f*100/5
        @plan = Plan.find(params[:id])
        @user = User.find(@plan.user_id)
        @reviews = @user.reviews
        @avg_review = Review.average(:evaluation)
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

    

    private

    def plan_params
        params.require(:plan).permit(:title, :can_do, :youtube, :body, :status, :consent, :plan_name, :price, :plan_detail, :video, :chat).merge(user_id: current_user.id)
    end
end
