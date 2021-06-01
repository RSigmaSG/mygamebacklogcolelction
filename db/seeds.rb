# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
DATA = {
  :user_keys =>
    ["username", "password"],
  :users => [
    ["Max Charles", "password"],
    ["Skai Jackson", "password"],
    ["Kaleo Elam", "password"],
    ["Megan Charpentier", "password"],
    ["Hayden Byerly", "password"],
    ["Tenzing Norgay Trainor", "password"],
    ["Davis Cleveland", "password"],
    ["Cole Sand", "password"],
    ["Quvenzhané Wallis", "password"]
  ],
  :game_ids => [
    "28131",
    "3498",
    "290376",
    "290378",
    "40847",
    "445442",
    "5621",
    "10141"
  ]
}

def main
  make_users
  make_games
  make_posts_and_plays
end

def make_users
  DATA[:users].each do |user|
    new_user = User.new
    user.each_with_index do |attribute, i|
      new_user.send(DATA[:user_keys][i]+"=", attribute)
    end
    new_user.save
  end
end

def make_games
  DATA[:game_ids].each do |id|
    game = Game.new(Scraper.scrape_game_API("https://api.rawg.io/api" + "/games/" + id.to_s + "?key=0895c28de6834c4498868d10c986b87b"))
    game.save
  end
end

def make_posts_and_plays

    plays_iterator = 0
    total_plays =  rand(30..50)
    until plays_iterator == total_plays  do
        play = Play.new
        play.game = Game.all.sample
        play.user = User.all.sample
        play.save

        posts_iterator = 0
        total_posts =  rand(8..20)
        until posts_iterator == total_posts  do
            post = Post.new
            play.posts << post
            post.thoughts = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Eget egestas purus viverra accumsan in nisl nisi scelerisque eu. Convallis tellus id interdum velit. Consectetur purus ut faucibus pulvinar elementum integer enim neque volutpat. Facilisi nullam vehicula ipsum a. Faucibus nisl tincidunt eget nullam non nisi. Non quam lacus suspendisse faucibus interdum posuere lorem ipsum dolor. Volutpat consequat mauris nunc congue nisi vitae. Elementum tempus egestas sed sed risus."
            post.current_playtime = rand(1..6)
            post.save

            posts_iterator = posts_iterator + 1
        end
        
        play.completed = [true, false].sample
        play.save
        plays_iterator = plays_iterator + 1
        #binding.pry
    end
    
end

main