class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def index
        @users= User.all
        @users= User.search(params[:search])
    end

    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to login_path
        else
            render 'new'
        end
    end
    
    private
    
        def user_params
            params.require(:user).permit(:name, :mail, :password, :password_confirmation)
        end
end
