# frozen_string_literal: true

module Users
  class SessionsController < Devise::SessionsController
    # before_action :configure_sign_in_params, only: [:create]
    def guest_sign_in
      user = User.guest
      sign_in user
      redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
    end
    # GET /resource/sign_in

    # DELETE /resource/sign_out
    def destroy
      signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
      set_flash_message! :notice, :signed_out if signed_out
      yield if block_given?
      redirect_to root_path # renderで遷移先のURLを記述 ← コード記入
    end

    # If you have extra params to permit, append them to the sanitizer.
    # def configure_sign_in_params
    #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
    # end
  end
end
