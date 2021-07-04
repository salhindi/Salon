class SessionsController < ApplicationController
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
        elsif @user = User.find_by(username: params[:user][:username])
        @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash[:danger] = 'Invalid email/password combination'
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
