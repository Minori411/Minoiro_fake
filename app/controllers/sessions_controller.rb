class SessionsController < ApplicationController



  def new
    @user=User.new
  end

  def create
    user=User.find_by(email: session_params[:email])#まず、送られてきたメースアドレスでユーザーを検索する

      if user&.authenticate(session_params[:password])#ユーザーが見つかった場合には、送られてきたパスワードによる認証をauthenticateメソッドを使って行います
      session[:user_id]=user.id#認証に成功した場合に、セッションにuser_idを格納しています。

      redirect_to root_path, notice: 'ログインしました'

    else
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to root_path, notice: 'ログアウトしました。'
  end

  private

    def set_user
      @user = User.find_by!(email: session_params[:email])
    rescue
      flash.now[:danger] = t('.flash.invalid_email')
      render action: 'new'
    end

    # 許可するパラメータ
    def session_params
      params.require(:session).permit(:email, :password)
    end


end
