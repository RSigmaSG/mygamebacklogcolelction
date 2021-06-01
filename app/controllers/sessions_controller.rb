class SessionsController < ApplicationController

    def create
      @user = User.find_by(username: params[:user][:username])
      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        session[:username] = @user.username
        redirect_to welcome_path(@user)
      else
        redirect_to '/login'
      end
    end
    def new
    end
    def destroy
        session.delete :username
        session.delete :user_id
        redirect_to root_path
    end

    def require_login
        return head(:forbidden) unless session.include? :username
    end
  end