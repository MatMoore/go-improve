require 'test_helper'

class AllocationTest < ActiveSupport::TestCase
    extend Minitest::Spec::DSL

    let(:game) do
        FactoryGirl.build(:game, black_rank: "10k", review_for: :black)
    end

    def assert_more_suitable(more, less)
        more_score = Allocation.suitability(game, more)
        less_score = Allocation.suitability(game, less)

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

    test "finding an obvious allocation" do
        ga = FactoryGirl.build(:game, black_rank: "10k", review_for: :black)
        a = FactoryGirl.build(:user, rank: "5k")
        gb = FactoryGirl.build(:game, black_rank: "15k", review_for: :black)
        b = FactoryGirl.build(:user, rank: "10k")
        gc = FactoryGirl.build(:game, black_rank: "5k", review_for: :black)
        c = FactoryGirl.build(:user, rank: "1d")

        pairs = Allocation.allocate([a, b, c], [ga, gb, gc]).to_a

        assert_equal(pairs, [[ga, a], [gb, b], [gc, c]])
    end

    test "when there are not enough reviewers, the last games are left unallocated" do
        ga = FactoryGirl.build(:game, black_rank: "10k", review_for: :black)
        a = FactoryGirl.build(:user, rank: "5k")
        gb = FactoryGirl.build(:game, black_rank: "15k", review_for: :black)
        b = FactoryGirl.build(:user, rank: "10k")
        gc = FactoryGirl.build(:game, black_rank: "5k", review_for: :black)
        pairs = Allocation.allocate([a, b], [ga, gb, gc]).to_a

        assert_equal(pairs, [[ga, a], [gb, b], [gc, nil]])
    end

    test "first game gets first choice of reviewer" do
        first = FactoryGirl.build(:game, black_rank: "10k", review_for: :black)
        second = FactoryGirl.build(:game, black_rank: "10k", review_for: :black)
        suitable = FactoryGirl.build(:user, rank: "5k")
        less_suitable = FactoryGirl.build(:user, rank: "10k")
        pairs = Allocation.allocate([less_suitable, suitable], [first, second]).to_a

        assert_equal(pairs, [[first, suitable], [second, less_suitable]])
    end

    test "no reviewers" do
        game = FactoryGirl.build(:game, black_rank: "10k", review_for: :black)
        pairs = Allocation.allocate([], [game]).to_a

        assert_equal(pairs, [[game, nil]])
    end

    test "no games" do
        user = FactoryGirl.build(:user, rank: "5k")
        pairs = Allocation.allocate([user], []).to_a

        assert_equal(pairs, [])
    end

    def gen_allocatables
        num_games = 10
        num_reviewers = num_games + Random.rand(10)

        games = []
        num_games.times do
            games << FactoryGirl.build(:game, black_rank: gen_rank, review_for: :black)
        end

        reviewers = []
        num_reviewers.times do
            reviewers << FactoryGirl.build(:user, rank: gen_rank)
        end

        [games, reviewers]
    end

    def gen_rank
        kyus = (1...25).map {|k| "#{k}k"}
        dans = (1...9).map {|d| "#{d}d"}
        (kyus + dans).sample
    end

    def random_allocation(games, reviewers)
        games.zip(reviewers.shuffle)
    end

    def pareto_improvement?(before, after)
        before.zip(after).all? do |(game, old), (_, new)|
            before_suitability = Allocation.suitability(game, old)
            after_suitability = Allocation.suitability(game, new)
            after_suitability >= before_suitability
        end
    end

    test "allocation looks pareto efficient" do
        10.times do
            games, reviewers = gen_allocatables

            real = Allocation.allocate(reviewers, games)

            1000.times do
                random = random_allocation(games, reviewers)
                refute pareto_improvement?(real, random),
                    "Found pareto improvement from #{real} -> #{random}"
            end
        end
    end
end


