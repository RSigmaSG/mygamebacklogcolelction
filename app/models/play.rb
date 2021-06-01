class Play < ApplicationRecord
    belongs_to :user, optional: true
    belongs_to :game, optional: true
    has_many :posts

    scope :in_progress, -> { where(completed: false) }

    def total_playtime
        out = 0
        self.posts.each do |post|
            out+=post.current_playtime
            
        end
        out
        #binding.pry 
    end
end
