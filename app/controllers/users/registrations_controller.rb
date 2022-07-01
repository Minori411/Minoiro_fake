# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  before_action :ensure_normal_user, only: %i[update destroy]

def ensure_normal_user
  if resource.email == 'guest@example.com'
    redirect_to root_path, alert: 'ゲストユーザーの更新・削除はできません。'
  end
end
  # GET /resource/sign_up
def new
  @user = User.new
end
  # プロフィール画面用のアクションを追加
def detail
  if user_signed_in?
    @user = User.find_by(id: params[:id])
    @sum_total_consultants = current_user.contracts.where(consultant_id:  current_user.id).count
    @sum_total_customers = current_user.contracts.where(customer_id:  current_user.id).count
  end

end

# protected

# ここのコメントアウトを外してリダイレクト先を指定
# ルートパス名でも良い
# The path used after sign up.
def after_sign_up_path_for(resource)
  "/user/#{current_user.id}"
end
  # POST /resource

def create
  @user = User.new(user_params)
  if @user.save
    # 保存の成功をここで扱う。
    redirect_to user_path(@user.id)
  else
    render 'new'
  end
end




private

def user_params
  params.require(:user).permit(:name,:email,:password,:password_confirmation,:userstyle,:is_kiyaku)
end



  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  def destroy
    resource.soft_destroy # <- 論理削除を実行
    Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
    set_flash_message :notice, :destroyed
    yield resource if block_given?
    respond_with_navigational(resource){ redirect_to after_sign_out_path_for(resource_name) }
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
