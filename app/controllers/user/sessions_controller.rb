class User::SessionsController < User::Base 
   
    def new 
         if current_user 
            redirect_to :user_root
         else 
            @user_login_form = User::LoginForm.new 
            render action: "new"
         end
    end

    def create 
      @user_login_form = User::LoginForm.new(login_params)
      if @user_login_form.email.present? 
         user = User.find_by(email: @user_login_form.email)
      end
      if User::Authenticator.new(user).authenticate(@user_login_form.password) 
         session[:user_id] = user.id 
         redirect_to :user_root 
      else 
         render 'new'
      end
    end

    def destroy 
      session.delete(:user_id)
      redirect_to :user_root
    end


    private def login_params
      params.require(:user_login_form).permit(:email, :password)
    end 


end
