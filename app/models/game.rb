class Game < ActiveRecord::Base
    validates :review_for, presence: true
    enum       review_for: [:black, :white, :either]
    validates :black_player, presence: true
    validates :white_player, presence: true
    validates :sgf_contents, presence: true
    validates :black_rank, presence: true, format: Rank::REGEX
    validates :white_rank, presence: true, format: Rank::REGEX

    belongs_to :user
    validates  :user, presence: true
    has_many :reviews

    def review_rank
        case review_for.to_sym
        when :black
            Rank.new(black_rank)
        when :white
            Rank.new(white_rank)
        else
            [Rank.new(black_rank), Rank.new(white_rank)].min
        end
    end

    def inspect
        "Game(black_rank: #{black_rank}, white_rank:#{white_rank})"
    end
end
