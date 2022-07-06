class RoomsController < ApplicationController
  before_action :authenticate_user!
  def create
    room = Room.create
    current_entry = Entry.create(user_id: current_user.id, room_id: room.id)
    another_entry = Entry.create!(params.require(:entry).permit(:user_id, :room_id).merge(room_id: room.id))
    redirect_to room_path(room)
  end

  def index
    # ログインユーザー所属ルームID取得
    current_entries = current_user.entries
    my_room_id = []
    current_entries.each do |entry|
      my_room_id << entry.room.id
    end
    # 自分のroom_idでuser_idが自分じゃないのを取得
    @another_entries = Entry.where(room_id: my_room_id).where.not(user_id: current_user.id)
  end

  def show
    @plan = Plan.find(params[:id])
    @user = User.find(params[:id])
    @room = Room.find(params[:id])
    @messages = @room.messages.all
    @message = Message.new
    @entries = @room.entries
    @another_entry = @entries.where.not(user_id: current_user.id).first
  end

  def edit
    @room = Room.find(params[:id])
    @message = Message.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    @message = Message.find(params[:id])
    if @message.update(message_params)
      redirect_to room_path(@room.id)
    else
      render :edit
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to action: 'show'
  end

  def message_params
    params.require(:message).permit(:body).merge(room_id: @room.id)
  end
end
