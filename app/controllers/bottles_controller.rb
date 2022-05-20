class BottlesController < ApplicationController

  def new
  end

  def create_select_bottle
    @user_select_bottle = UserSelectBottle.new(user_select_bottle_params) 
    # 何を新しく保存するか指定
    if @user_select_bottle.save
      redirect_to bottles_result_path
    end
  end

  def result 
  end

private
  def user_select_bottle_params
    params.require(:user_select_bottle).permit(:bottle)  
  end 
end
