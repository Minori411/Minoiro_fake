class RelationshipsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    current_user.follow(@user)    
  end

  def destroy
    @user = User.find(params[:user_id])
    current_user.unfollow(@user)
    @relationship = Relationship.find_by(id: params[:id])
  end
end
