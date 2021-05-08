class UsersController < ApplicationController
    
    def new
        @user = User.new
    end

    def create
      @user = User.create(user_params)
      if @user.save
        session[:user_id] = @user.id
        session[:username] = @user.username
        redirect_to welcome_path(@user)
      else
        redirect_to '/users/new'
      end
    end
   
    private
   
    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation)
    end
  end