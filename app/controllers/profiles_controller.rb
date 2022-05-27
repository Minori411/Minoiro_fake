class ProfilesController < ApplicationController

    def show
        @user = User.find(current_user.id)
    end

    def edit
        @user = User.find(current_user.id)
    end
    
    def update
        @user = User.find(current_user.id)
        if @user.update(user_params)
            redirect_to profile_path, success: t('defaults.message.edited', item: User.model_name.human)
        else
            flash.now['danger'] = t('defaults.message.not_edited', item: User.model_name.human)
            render :edit 
        end
    end
    
    private
    
    def user_params
        params.require(:user).permit(:email, :name, :user_image, :prefecture, :imtroduction, :career, :nickname, :url, :userstyle, :career)
    end
end
