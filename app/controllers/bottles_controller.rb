class BottlesController < ApplicationController
  def new; end

  def create_select_bottle
    current_user.user_select_bottles.destroy_all
    
    save_bottle(params[:bottle_hid_1])
    save_bottle(params[:bottle_hid_2])
    save_bottle(params[:bottle_hid_3])
    save_bottle(params[:bottle_hid_4])
    redirect_to bottles_result_path
  end

  def result
    @select_bottles = UserSelectBottle.where(user_id: current_user.id)
  end

  private
  def save_bottle(bottle_type)
    @user_select_bottle = UserSelectBottle.new
    # 下記1行は不要。あとで上書きしている
    @user_select_bottle.bottle_id = params[:bottle_hid_4]
    @bottle = Bottle.find_by(bottle_type: bottle_type)
    @user_select_bottle.bottle_id = @bottle.id
    @user_select_bottle.user_id = current_user.id
    @user_select_bottle.save!

  end

end
