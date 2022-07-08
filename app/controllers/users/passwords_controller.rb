# frozen_string_literal: true

module Users
  class PasswordsController < Devise::PasswordsController
    before_action :ensure_normal_user, only: :create

    def ensure_normal_user
      if params[:user][:email].casecmp('guest@example.com').zero?
        redirect_to new_user_session_path,
                
      end
    end
  end
end
