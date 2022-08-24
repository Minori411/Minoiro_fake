class ContractsController < ApplicationController
  def index
    @contract = Contract.new
    @plan = Plan.find(params[:plan_id])
    @user = User.find(@plan.user_id)
    @reviews = @user.reviews.order("created_at DESC")
    if @reviews.present?
      @avg_score = @reviews.average(:evaluation).present? ? @reviews.average(:evaluation).round(1) : 0
      @avg_review = @plan.user.reviews.average(:evaluation).round(1)
      @avg_score_percentage = @reviews.average(:evaluation).round(1).to_f * 100 / 5
    else
      @avg_score = 0
      @avg_score_percentage = 0
      @avg_review = 0
    end
    @min_price = @plan.smallplans.minimum(:price)
    @current_entry = Entry.where(user_id: current_user.id)
    @another_entry = Entry.where(user_id: @user.id)
    @room = Room.new
    unless @user.id == current_user.id
      @current_entry.each do |current|
        @another_entry.each do |another|
          if current.room_id == another.room_id
            @is_room = true
            @room_id = current.room_id
          end
        end
      end
      unless @is_room
        @room = Room.new
        @entry = Entry.new
      end
    end
  end

  def create
    @contract = Contract.new # 何を新しく保存するか指定
    @plan = Plan.find(params[:plan_id])
    @user = User.find(@plan.user_id)

    @contract.assign_attributes(
      plan_id: @plan.id,
      consultant_id: @plan.user_id,
      customer_id: current_user.id,
      user_id: @plan.user_id
    )

    if @contract.save! # もし保存ができたら
      logger.debug("成功")
      redirect_to plan_contract_path(@plan.id, @contract.id) # 投稿画面に遷移
    else # できなければ
      logger.debug("失敗")
      logger.debug(@contract.errors.full_messages)
      render :index # newに遷移
    end
  end

  def show
    @smallplan = Smallplan.find(params[:id])
    @plan = Plan.find(params[:plan_id])
    @user = User.find(@plan.user_id)
    @reviews = @user.reviews.order("created_at DESC")

    # TODO: unless よりは if を使う
    if @reviews.present?
      @avg_score = @reviews.average(:evaluation).present? ? @reviews.average(:evaluation).round(1) : 0
      @avg_review = @plan.user.reviews.average(:evaluation).round(1)
      @avg_score_percentage = @reviews.average(:evaluation).round(1).to_f * 100 / 5
    else
      @avg_score = 0
      @avg_score_percentage = 0
      @avg_review = 0
    end
    @min_price = @plan.smallplans.minimum(:price)
    @current_entry = Entry.where(user_id: current_user.id)
    @another_entry = Entry.where(user_id: @user.id)

    # REVIEW: 全般複雑です。シンプルな構成を目指しましょう。
    #
    # 1. @roomはどのプログラムを通ってもRoom.newになる。
    # 2. 分岐・繰り返し処理が多い。unless x 2, if x 1, each x 2(入れ子)
    #   @current_entryのroom_id(複数)と@another_entryのroom_id(複数)に同じroom_idが含まれているか比較すれば軽量化できる
    #   https://qiita.com/takaram/items/fdc2b1897d68b3f2d848
    # 3. show.htmlの抜粋です。コントローラのみでなくビューでも分岐処理が登場している。
    #             <% if @user.id != current_user.id && current_user.customer? %>
    #                 <% if @is_room == true %>
    #                     <p class="user-show-room"><a href="/rooms/<%= @room_id %>" class="btn btn-primary btn-lg">チャットへ</a>
    #                 <% else %>
    #                     <%= form_for @room do |f| %>
    #                     <%= fields_for @entry do |e| %>
    #                         <%= e.hidden_field :user_id, value: @user.id %>
    #                     <% end %>
    #                     <%= f.submit "メッセージで相談する", class:"btn btn-primary btn-lg side-bar-message"%>
    #                     <% end %>
    #                 <% end %>
    #             <% end %>
    @room = Room.new
    # TODO: unless よりは if を使う
    unless @user.id == current_user.id
      @current_entry.each do |current|
        @another_entry.each do |another|
          if current.room_id == another.room_id
            @is_room = true
            @room_id = current.room_id
          end
        end
      end
      unless @is_room
        @room = Room.new
        @entry = Entry.new
      end
    end
  end
end
