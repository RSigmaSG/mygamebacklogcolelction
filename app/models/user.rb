class User < ApplicationRecord
    has_secure_password
    has_many :plays
    has_many :posts, through: :plays

    validates :username, presence: true
    validates :password, length: { in: 6..20 }

end
