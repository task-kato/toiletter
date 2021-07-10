class User::SessionsController < User::Base

  def new
    if current_user
      redirect_to :user_root
    else
      @user_login_form = User::LoginForm.new
      render action: 'new'
    end
  end

  def create
    @user_login_form = User::LoginForm.new(user_login_params)

    if @user_login_form.email.present?
      user = User.find_by(email: @user_login_form.email)
    elsif user && user.suspended?
      flash.now.alert = 'アカウントが停止されています。'
      redirect_to 'new'
    end

    if User::Authenticator.new(user).authenticate(@user_login_form.password)
      session[:user_id] = user.id
      flash.notice = 'ログインしました！'
      redirect_to :user_root
    else
      flash.now.alert = 'パスワードまたはメールアドレスが間違っています。'
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    flash.notice = 'ログアウトしました。'
    redirect_to :user_root
  end

  private def user_login_params
    params.require(:user_login_form).permit(:email, :password)
  end

end
