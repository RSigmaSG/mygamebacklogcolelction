require 'nokogiri'
require 'open-uri'
require 'rest-client'
require 'pry'

class Scraper

  def self.scrape_game_API(game_url)
    
    game_hash = {}
    
    response = RestClient.get(game_url)
    api_game_hash = JSON.parse response

    game_hash[:id] = api_game_hash["id"]
    game_hash[:title] = api_game_hash["name"]
    game_hash[:released] = api_game_hash["released"]
    game_hash[:image_url] = api_game_hash["background_image"]
    game_hash[:description] = api_game_hash["description"]
    
    #binding.pry
   #binding.pry
   game_hash
    
  end

  def self.scrape_search_api(search_url)
    #binding.pry
    games = []

    response = RestClient.get(search_url)
    api_result_hash = JSON.parse response

    api_result_hash["results"].each do |hash|
      newGameHash = Game.new
      newGameHash[:id] = hash["id"]
      newGameHash[:title] = hash["name"]
      newGameHash[:released] = hash["released"]
      newGameHash[:image_url] = hash["background_image"]
      newGameHash[:description] = hash["description"]
      games.push(newGameHash)
    end
    

    games
    
  end

end

