class User < ApplicationRecord
    has_secure_password
    has_many :posts
    has_many :games, through: :posts
end
