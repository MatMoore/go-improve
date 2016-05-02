class Review < ActiveRecord::Base
    belongs_to :game
    belongs_to :user

    validates  :user, presence: true
    validates :reviewer_rank, presence: true, format: Rank::REGEX
end
