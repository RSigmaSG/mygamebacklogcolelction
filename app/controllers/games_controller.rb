class GamesController < ApplicationController

    @@url = "https://api.rawg.io/api"
    @@key = "?key=0895c28de6834c4498868d10c986b87b"
    def show
        if (!Game.exists?(params[:id]))
            @game = Game.new(Scraper.scrape_game_API(@@url + "/games/" + params[:id].to_s + @@key))
        else
            @game = Game.find(params[:id])
        end
    end
end
