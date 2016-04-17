# Generate some player ranks that follow the KGS distribution
# http://senseis.xmp.net/?KGSRankHistogram%2FData
module Distribution
    RANK_DIST = [
        ["29k", 3],
        ["28k", 8],
        ["27k", 12],
        ["26k", 27],
        ["25k", 40],
        ["24k", 66],
        ["23k", 82],
        ["22k", 107],
        ["21k", 135],
        ["20k", 164],
        ["19k", 228],
        ["18k", 332],
        ["17k", 373],
        ["16k", 404],
        ["15k", 397],
        ["14k", 441],
        ["13k", 537],
        ["12k", 649],
        ["11k", 632],
        ["10k", 556],
        ["9k", 586],
        ["8k", 595],
        ["7k", 524],
        ["6k", 608],
        ["5k", 534],
        ["4k", 480],
        ["3k", 434],
        ["2k", 454],
        ["1k", 398],
        ["1d", 298],
        ["2d", 271],
        ["3d", 208],
        ["4d", 152],
        ["5d", 111],
        ["6d", 86],
        ["7d", 42],
        ["8d", 33],
        ["9d", 15],
    ]

    cumulative_dist = []
    total = 0

    RANK_DIST.each do |bucket|
        rank, number = bucket
        total += number
        cumulative_dist << [rank, total]
    end

    TOTAL = total
    CUMULATIVE_RANK_DIST = cumulative_dist

    def self.generate
        n = rand(TOTAL)
        less_than_n = lambda {|bucket| bucket.second < n}
        bucket = CUMULATIVE_RANK_DIST.drop_while(&less_than_n).first
        bucket.first
    end
end

namespace :generate do
  desc "Generate some random players. This can be used to seed the dev/test databases"
  task players: :environment do
    output = []
    100.times do
        output << {
            email: Faker::Internet.email,
            display_name: Faker::Internet.user_name,
            rank: Distribution.generate,
            review_period: 1 + rand(30)
        }
    end

    puts JSON.pretty_generate(output)
  end

end
