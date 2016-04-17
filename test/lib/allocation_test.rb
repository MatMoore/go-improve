require 'test_helper'

class AllocationTest < ActiveSupport::TestCase
    def setup
        @game = FactoryGirl.build(:game, black_rank: "10k", review_for: :black)
    end

    def assert_more_suitable(more, less)
        more_score = Allocation.suitability(@game, more)
        less_score = Allocation.suitability(@game, less)

        assert more_score > less_score
    end

    test "much stronger scores lower than slightly stronger" do
        slightly = FactoryGirl.build(:user, rank: "5k")
        much = FactoryGirl.build(:user, rank: "5d")

        assert_more_suitable(slightly, much)
    end

    test "a weaker player can be more suitable than a stronger player" do
        weaker = FactoryGirl.build(:user, rank: "11k")
        stronger = FactoryGirl.build(:user, rank: "5d")

        assert_more_suitable(weaker, stronger)
    end

    test "a stronger player is usually more suitable than a weaker player" do
        weaker = FactoryGirl.build(:user, rank: "20k")
        stronger = FactoryGirl.build(:user, rank: "1d")

        assert_more_suitable(stronger, weaker)
    end

    test "slightly weaker is better than a lot weaker" do
        slightly = FactoryGirl.build(:user, rank: "11k")
        lots = FactoryGirl.build(:user, rank: "20k")

        assert_more_suitable(slightly, lots)
    end
end

