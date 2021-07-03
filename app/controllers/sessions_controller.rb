class SessionsController < ApplicationController
    def new
        @user = User.new
    end

    def create 
        @user = User.find_by(username: params[:user][:username])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash.now[:alert] = "Invalid credentials. Try again."
            render :new
        end
    end

    def omniauth
        @user = User.from_omniauth(auth)
        @user.save
        session[:user_id] = @user.id
        redirect_to root_path
    end
     

    def destroy 
        session.clear
        redirect_to root_path
    end 
    
    
    private
      def auth
        request.env['omniauth.auth']
      end
end
