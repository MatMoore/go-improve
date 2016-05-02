class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :registerable,
         :database_authenticatable, :rememberable, :trackable, :timeoutable, :validatable,
         :confirmable

    validates :rank, presence: true, format: Rank::REGEX
    validates :review_period, presence: true, numericality: {
        only_integer: true,
        greater_than_or_equal_to: 1,
        less_than_or_equal_to: 90
    }

  def reviewer_rank
      Rank.new(rank)
  end

  def inspect
      "User(display_name: #{display_name}, rank:#{rank})"
  end
end
