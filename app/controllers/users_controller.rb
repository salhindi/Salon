class UsersController < ApplicationController
    def index
    end

    def new
        if logged_in?
            redirect_to root_path
        else
            @user = User.new
        end
    end

    def create
        if logged_in?
            redirect_to root_path
        end

        @user = User.new(user_params)
        if @user.valid?
         @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user.id)
        else
            render :new
        end
    end

    def show
        require_login
        if params[:id] = current_user.id
            @user = User.find_by(id: params[:id])
        else
            redirect_to root_path
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :username, :salon_name)
    end
end
