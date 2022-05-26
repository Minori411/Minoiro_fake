class BottlesController < ApplicationController

  def new
  end

  def create_select_bottle
      @user_select_bottle5 = UserSelectBottle.new
      @user_select_bottle5.bottle_id = params[:botle_id]
      @user_select_bottle5.user_id = current_user.id
      # 何を新しく保存するか指定
      if @user_select_bottle5.save!
      logger.debug("ボトル5成功")
      end
    
      @user_select_bottle6 = UserSelectBottle.new
      @user_select_bottle6.bottle_id = params[:bottle_id]
      @user_select_bottle6.user_id = current_user.id
      # 何を新しく保存するか指定
      if @user_select_bottle6.save!
        logger.debug("ボトル6成功")
      end
    
      @user_select_bottle7 = UserSelectBottle.new
      @user_select_bottle7.bottle_id = params[:bottle_id]
      @user_select_bottle7.user_id = current_user.id
      # 何を新しく保存するか指定
      if @user_select_bottle7.save!
        logger.debug("ボトル7成功")
      end
    
      @user_select_bottle8 = UserSelectBottle.new
      @user_select_bottle8.bottle_id = params[:bottle_id]
      @user_select_bottle8.user_id = current_user.id
      # 何を新しく保存するか指定
      if @user_select_bottle8.save!
        logger.debug("ボトル8成功")
      end
      redirect_to bottles_result_path
    end
  
  def result 
  end
  
end
