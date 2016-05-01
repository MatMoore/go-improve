class Game < ActiveRecord::Base
    # TODO: validate everything
    #
    enum review_for: [:black, :white, :either]
    has_many :reviews
    belongs_to :user

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
