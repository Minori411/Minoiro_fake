class BottlesController < ApplicationController

  def new
  end

  def create_select_bottle
      current_user.user_select_bottles.destroy_all
      @user_select_bottle1 = UserSelectBottle.new
      @user_select_bottle1.bottle_id = params[:bottle_hid_1]
      @bottle1 = Bottle.find_by(bottle_type: params[:bottle_hid_1])
      logger.debug(@bottle1.bottle_type)
      @user_select_bottle1.bottle_id = @bottle1.id
      @user_select_bottle1.user_id = current_user.id
      # 何を新しく保存するか指定
      if @user_select_bottle1.save!
        logger.debug("ボトル1成功")
      end
    
      @user_select_bottle2 = UserSelectBottle.new
      @user_select_bottle2.bottle_id = params[:bottle_hid_2]
      @bottle2 = Bottle.find_by(bottle_type: params[:bottle_hid_2])
      logger.debug(@bottle2.id)
      @user_select_bottle2.bottle_id = @bottle2.id
      @user_select_bottle2.user_id = current_user.id
      # 何を新しく保存するか指定
      if @user_select_bottle2.save!
        logger.debug("ボトル2成功")
      end
    
      @user_select_bottle3 = UserSelectBottle.new
      @user_select_bottle3.bottle_id = params[:bottle_hid_3]
      @bottle3 = Bottle.find_by(bottle_type: params[:bottle_hid_3])
      logger.debug(@bottle3.id)
      @user_select_bottle3.bottle_id = @bottle3.id
      @user_select_bottle3.user_id = current_user.id
      # 何を新しく保存するか指定
      if @user_select_bottle3.save!
        logger.debug("ボトル3成功")
      end
    
      @user_select_bottle4 = UserSelectBottle.new
      @user_select_bottle4.bottle_id = params[:bottle_hid_4]
      @bottle4= Bottle.find_by(bottle_type: params[:bottle_hid_4])
      logger.debug(@bottle1.id)
      @user_select_bottle4.bottle_id = @bottle4.id
      @user_select_bottle4.user_id = current_user.id
      # 何を新しく保存するか指定
      if @user_select_bottle4.save!
        logger.debug("ボトル4成功")
      end
      redirect_to bottles_result_path
  end
  
  def result 
    @select_bottles = UserSelectBottle.where(user_id: current_user.id)
  end
  
end

