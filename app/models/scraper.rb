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
    
    #binding.pry
   #binding.pry
   game_hash
    
  end

  def self.scrape_stock_page(stock_url)
    
    begin
        doc = Nokogiri::HTML(open(stock_url))

    rescue
        return nil
    end
    

    #binding.pry
    stock = {}

    stock_name =  doc.css("#quote-header-info div div div")[0].text.split(" ")
    stock[:ticker] = stock_name.pop.split(/[()]/)[1]
    stock[:name] = stock_name.join(" ")
    stock[:price] =  doc.css("#quote-header-info div div div span")[3].text
    stock[:market_cap] =  doc.css("#quote-summary div span")[13].text
    
    stock
    #binding.pry

  end

end

