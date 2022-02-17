class UsersController < ApplicationController

    def show
    end

    def new
        @user = User.new
    end
    
    def index
        @users= User.all
        @users= User.search(params[:search])
    end

    def create
        @user = User.new(user_params)    # 実装は終わっていないことに注意!
        if @user.save
            # 保存の成功をここで扱う。
            redirect_to root_path
        else
            render 'new'
        end
    end
    
    private
    
    def user_params
        params.require(:user).permit(:name, :mail, :password, :password_confirmation)
    end



end
