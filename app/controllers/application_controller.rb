class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :set_search
    before_action :set_q

    protect_from_forgery with: :null_session  # このアクションを追加
  def after_sign_in_path_for(resource)
    "/user/#{current_user.id}"
  end

  def after_sign_out_path_for(resource)
    logout_path
  end

  def search
    @results = @q.result
  end

  def set_q
    @q = User.ransack(params[:q])
  end

  def set_search
    #@search = Article.search(params[:q])
    @search = User.ransack(params[:q]) #ransackメソッド推奨
    @search_users = @search.result.page(params[:page])
  end



  protected

  # 入力フォームからアカウント名情報をDBに保存するために追加
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:userstyle,:nickname,:user_image,:email])
  end

end
