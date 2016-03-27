class ReviewsController < ApplicationController
  def new
      @game = Game.find(params[:game_id])
  end

  def create
      @game = Game.find(params[:game_id])

      attributes = params[:review].permit(
        :reviewer_name,
        :reviewer_rank,
        :deadline
      )

      @review = Review.new(attributes)
      @review.save
      redirect_to @game
  end

end
