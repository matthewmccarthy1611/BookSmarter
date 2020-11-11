class UsersController < ApplicationController
    
    def index
        redirect_to root_path
    end
    
    def show
        if @user  = User.find_by_id(params[:id])
            @user
        else
            flash[:alert] = "User does not exist"
            redirect_to root_path
        end
    end

    private

    def user_params
        params.require(:user).permit(:email, :password, :name, :password_confirmation)
    end
end