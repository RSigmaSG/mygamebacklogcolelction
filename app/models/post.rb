class Post < ApplicationRecord
    belongs_to :play, optional: true

    validates :thoughts, presence: true
    validates :current_playtime, numericality: { greater_than: 0 }
    
    
end
