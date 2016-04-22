module Allocation
    # The number of stones difference for an ideal review.
    IDEAL_RANK_DIFFERENCE = 5

    # Allocate each game to a reviewer using a serial-dictatorship algorithm.
    #
    # Each iteration, we examine one game, and the most suitable reviewer is
    # chosen from the remaining available reviewers.
    #
    # This gives a "pareto efficient" allocation, meaining we can't swap the
    # reviewers around in such a way that everyone is better off afterwards.
    #
    # We consider a reviewer to be suitable to review a game when the rank
    # difference is low, and the reviewer is stronger than the reviewee.
    #
    # We want to encourage more reviews and try not to spam a small subset of
    # users, so we ensure that each reviewer gets at most one game at a time,
    # and that each game gets assigned a reviewer if one is available, even if
    # the suitablity is bad.
    #
    # This assumes the queue of games to review is smaller than the number of
    # potential reviewers...
    def self.allocate(available_reviewers, games_to_review)
        return enum_for(:allocate, available_reviewers, games_to_review) unless block_given?

        available_reviewers = available_reviewers.dup

        games_to_review.each do |game|
            reviewer = available_reviewers.max_by {|potential| suitability(game, potential)}
            available_reviewers.delete(reviewer) unless reviewer.nil?

            yield [game, reviewer]
        end
    end

    def self.suitability(game, reviewer)
        rank_difference = reviewer.reviewer_rank - game.review_rank
        rank_difference_from_ideal = (rank_difference - IDEAL_RANK_DIFFERENCE).abs
        Math.exp(-rank_difference_from_ideal)
    end
end
