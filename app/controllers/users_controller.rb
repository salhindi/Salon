class UsersController < ApplicationController
    def index
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def show
        if !logged_in?
            redirect_to login_path
        else
            @user = User.find_by(id: params[:id])
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :username, :salon_name)
    end
end
