class GamesController < ApplicationController



    def search
        name = params[:search_term].to_s.split(" ").join("-")
        @games = Scraper.scrape_search_api(@@url + "/games" + @@key + "&search=" + name)    
        render :search
    end

    def show
        if (!Game.exists?(params[:id]))
            @game = Game.new(Scraper.scrape_game_API(@@url + "/games/" + params[:id].to_s + @@key))
        else
            @game = Game.find(params[:id])
        end
    end

end
