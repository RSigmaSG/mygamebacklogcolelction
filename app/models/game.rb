class Game < ApplicationRecord
    has_many :plays
    has_many :users

    has_many :posts, through: :plays
end
