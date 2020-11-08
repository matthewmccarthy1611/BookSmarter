class UsersController < ApplicationController
    
    def show
        @user  = User.find_by_id(params[:id])
        if @user
            @user
        else
            flash[:alert] = "User does not exist"
            redirect_to user_path(@user)
        end
    end

    private

    def user_params
        params.require(:user).permit(:email, :password, :name, :password_confirmation)
    end
end