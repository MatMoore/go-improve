class Game < ActiveRecord::Base
    enum review_for: [:black, :white, :either]
    has_many :reviews
    belongs_to :user
end
