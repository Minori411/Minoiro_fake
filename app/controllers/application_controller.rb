class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?   #追加部分
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  http_basic_authenticate_with :name => ENV["BASIC_AUTH_USER"], :password => ENV["BASIC_AUTH_PASSWORD"] if Rails.env.production?


  protect_from_forgery with: :null_session  # このアクションを追加
  def after_sign_in_path_for(_resource)
    "/user/#{current_user.id}"
  end

  def after_sign_out_path_for(_resource)
    logout_path
  end

  def search
    @users = User.search(params[:keyword])
    @keyword = params[:keyword]
    render "index"
  end

  private

  def move_to_signed_in
    unless user_signed_in?
      # サインインしていないユーザーはログインページが表示される
      redirect_to '/users/sign_in'
    end
  end
  
  def production?   #追加部分〜
    Rails.env.production?
  end 
  
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
    username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"] 
    end
  end

  protected

  # 入力フォームからアカウント名情報をDBに保存するために追加
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: [:name, :userstyle, :nickname, :user_image, :email])
  end
end
