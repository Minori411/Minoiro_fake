class ApplicationController < ActionController::Base

    private

    def after_sign_out_path_for(resource_or_scope)
        destroy_user_session_path    
    end

    # このアクションを追加
    def after_sign_in_path_for(resource_or_scope)
        "/user/#{current_user.id}"
    end

    protected

    
end
