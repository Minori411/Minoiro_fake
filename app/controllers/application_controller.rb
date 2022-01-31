class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    private

    def after_sign_out_path_for(resource_or_scope)
        destroy_user_session_path    
    end

    # このアクションを追加
    def after_sign_in_path_for(resource_or_scope)
        "/user/#{current_user.id}"
    end

    protected

    # 入力フォームからアカウント名情報をDBに保存するために追加
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end
end
