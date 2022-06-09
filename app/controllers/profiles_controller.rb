class ProfilesController < ApplicationController
    before_action :set_user,only: %i[edit update]

    def index
        @avg_score = Review.average(:evaluation).round(1)
        @avg_score_percentage = Review.average(:evaluation).round(1).to_f*100/5
        @sum_total_consultants = Contract.count(:consultant_id)
        @sum_total_customers = Contract.count(:customer_id)
        @user = User.find_by(id: params[:user_id])
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
    end

    def update
        if @user.update(user_params)
            redirect_to profile_path,success: "ユーザーを更新しました"
        else
            flash.now[:danger] = "ユーザーを更新できませんでした"
            render :edit
        end
    end

    def show
        @avg_score = Review.average(:evaluation).round(1)
        @avg_score_percentage = Review.average(:evaluation).round(1).to_f*100/5
        @sum_total_consultants = Contract.count(:consultant_id)
        @sum_total_customers = Contract.count(:customer_id)
        @user = User.find(current_user.id)
    end

    private
    def set_user
        @user = User.find(current_user.id)
    end

    def user_params
        params.require(:user).permit(:email,:first_name,:last_name,:avater,:avater_cash)
    end
end
