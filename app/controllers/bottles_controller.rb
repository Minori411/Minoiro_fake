class BottlesController < ApplicationController

  def new
  end

  def create_select_bottle
    def create_select_bottle
      @user_select_bottle1 = UserSelectBottle.new
      @user_select_bottle1.bottle_id = params[:bottle1]
      @user_select_bottle1.user_id = current_user.id
      # 何を新しく保存するか指定
      if @user_select_bottle1.save!
      logger.debug("ボトル1成功")
      end
    
      @user_select_bottle2 = UserSelectBottle.new
      @user_select_bottle2.bottle_id = params[:bottle2]
      @user_select_bottle2.user_id = current_user.id
      # 何を新しく保存するか指定
      if @user_select_bottle2.save!
        logger.debug("ボトル2成功")
      end
    
      @user_select_bottle3 = UserSelectBottle.new
      @user_select_bottle3.bottle_id = params[:bottle3]
      @user_select_bottle3.user_id = current_user.id
      # 何を新しく保存するか指定
      if @user_select_bottle3.save!
        logger.debug("ボトル3成功")
      end
    
      @user_select_bottle4 = UserSelectBottle.new
      @user_select_bottle4.bottle_id = params[:bottle4]
      @user_select_bottle4.user_id = current_user.id
      # 何を新しく保存するか指定
      if @user_select_bottle4.save!
        logger.debug("ボトル4成功")
        redirect_to bottles_result_path
      end
    end
      
  end

  def result 
  end
  
end
