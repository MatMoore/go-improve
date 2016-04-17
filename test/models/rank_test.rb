require 'test_helper'

class RankTest < ActiveSupport::TestCase
  test "valid kyu ranks" do
    assert_nothing_raised do
        Rank.new("10k")
        Rank.new("20k")
        Rank.new("30k")
    end
  end

  test "valid dan ranks" do
    assert_nothing_raised do
        Rank.new("1d")
        Rank.new("9d")
    end
  end

  test "invalid rank" do
      assert_raises(ArgumentError) do
          Rank.new("1")
      end
      assert_raises(ArgumentError) do
          Rank.new("1a")
      end
  end

  test "lower kyu is ordered after higher kyu" do
      assert Rank.new("1k") > Rank.new("2k")

  end

  test "higher dan is ordered after lower dan" do
      assert Rank.new("1d") < Rank.new("2d")

  end

  test "dan is ordered after kyu" do
      assert Rank.new("1k") < Rank.new("1d")
  end
end

