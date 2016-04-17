FactoryGirl.define do
  factory :game do
    black_player "Alice"
    white_player "Bob"
    sgf_contents ""
    black_rank "10k"
    white_rank "10k"
    review_for :black
    user
  end
end
