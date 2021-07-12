class Staff::SessionsController < Staff::Base

  def new
    if current_staff
      redirect_to :staff_root
    else
      @staff_login_form = Staff::LoginForm.new
      render action: 'new'
    end
  end

  def create
    @staff_login_form = Staff::LoginForm.new(staff_login_params)
    if @staff_login_form.email.present?
      staff = Staff.find_by(email: @staff_login_form.email)
    elsif staff && staff.suspended?
      flash[:danger] = 'アカウントが停止されています。'
      redirect_to 'new'
    end

    if Staff::Authenticator.new(staff).authenticate(@staff_login_form.password)
      session[:staff_id] = staff.id
      flash.notice = 'ログインしました。'
      redirect_to :staff_root
    else
      flash[:danger] = 'パスワードまたはメールアドレスが間違っています。'
      redirect_to staff_login_path
    end
  end

  def destroy
    session.delete(:staff_id)
    flash.notice = 'ログアウトしました。'
    redirect_to :staff_root
  end

  private def staff_login_params
    params.require(:staff_login_form).permit(:email, :password)
  end

end
