class User::AccountsController < User::Base

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_account_params)
        if @user.save
            session[:user_id] = @user.id
            flash[:primary] = "スタッフアカウントを作成しました。"
            redirect_to :user_root
        else
            render action: "new"
        end
    end


    private def user_account_params
        params.require(:user_account).permit(
            :nick_name, :email, :password, :gender
        )
    end
end
