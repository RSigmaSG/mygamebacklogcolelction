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
        render :new
      end
    end

    def show
      @user = User.find(params[:id])
      @posts = @user.posts
      if params[:game_id]
        @posts = Game.find(params[:game_id]).plays.where(user_id: params[:id]).collect{|play| play.posts}.flatten
        if @posts.empty?
          flash[:alert] = "Posts not found."
          redirect_to root_path
        end
      end
    end
   
    private
   
    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation)
    end
  end