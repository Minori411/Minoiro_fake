class ProfilesController < ApplicationController
    before_action :set_user,only: %i[edit update]

    def index
        @user = User.find(params[:user_id])
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
