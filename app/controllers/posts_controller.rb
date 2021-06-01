class PostsController < ApplicationController
    def index
        if params[:user_id]
            user = User.find_by(id: params[:user_id])
            if user.nil?
              flash[:alert] = "User not found."
              redirect_to root_path
            else
              @posts = user.posts
            end
          else
            @posts = Post.all
          end
    end

    def edit
        @post = Post.find(params[:id])
        @game = @post.play.game
    end


    def show
        @post = Post.find(params[:id])
    end

    def new
        @post = Post.new
        @post.play = Play.new
        if(params.has_key?(:play_id))
            @play_id = params[:play_id]
            @post.play =  Play.find(params[:play_id])
            @game = @post.play.game
        elsif (!Game.exists?(params[:game_id]))
            @game = Game.new(Scraper.scrape_game_API(@@url + "/games/" + params[:game_id].to_s + @@key))
        else
            @game = Game.find(params[:game_id])
        end
    end
    
    def create
        @post = Post.new(post_params)
        #binding.pry
        
        #binding.pry
        if @post.save
            if(!@post.play)
                #binding.pry
                @post.play = Play.create
                play = @post.play
                #binding.pry
                if params[:completed] == "completed"
                    #binding.pry
                    play.completed = true
                end
                #play.total_playtime = @play.current_playtime
                play.game = Game.find_or_create_by(Scraper.scrape_game_API(@@url + "/games/" + params[:game_id].to_s + @@key))
                play.user = User.find(session[:user_id])
            else
                play = @post.play
            end
    
            @game = play.game
            play.save
            play.game.save
            @post.save
            redirect_to @post
        else
            @game = Game.find_or_create_by(Scraper.scrape_game_API(@@url + "/games/" + params[:game_id].to_s + @@key))
            @post.play = Play.new
            render :new
        end
    end


    def update
        @post = Post.find(params[:id])
    
        @post.update(post_params)
    
        if @post.save
          redirect_to @post
        else
          render :edit
        end
      end

      def destroy
        Post.find(params[:id]).destroy
        redirect_to root_path
      end

    private

    def post_params
      params.require(:post).permit(:thoughts, :current_playtime, :play_id)
    end
end
