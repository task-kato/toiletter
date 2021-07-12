class Staff::AccountsController < Staff::Base

    def index
        @staffs = Staff.all
    end

    def new
        @staff = Staff.new
    end

    def create
        @staff = Staff.new(staff_account_params)
        if @staff.save
            flash[:primary] = "スタッフアカウントを作成しました。"
            redirect_to :staff_accounts
        else
            render action: "new"
        end
    end

    def edit
        @staff = Staff.find(params[:id])
    end

    def update
        @staff = Staff.find(params[:id])
        @staff.assign_attributes(staff_account_params)
        if @staff.save
            flash[:primary] = "スタッフアカウントを更新しました。"
            redirect_to :staff_accounts
        else
            render action: "edit"
        end
    end

    def destroy
        staff = Staff.find(params[:id])
        staff.destroy!
        flash[:primary] = "スタッフアカウントを削除しました。"
        redirect_to :staff_accounts
    end

    private def staff_account_params
        params.require(:staff_account).permit(
            :nick_name, :email, :password, :gender
        )
    end

end
