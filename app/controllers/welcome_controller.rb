class WelcomeController < ApplicationController
    
    def show
        @user = User.find(params[:id])    
    end

    def index
        @post = Post.all
    end

    
end