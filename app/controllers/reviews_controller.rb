class ReviewsController < ApplicationController
  def new
      @game = Game.find(params[:game_id])
  end

  def show
      @review = Review.where(game_id: params[:game_id]).find(params[:id])
      @game = @review.game
  end

  def create
      @game = Game.find(params[:game_id])

      attributes = params[:review].permit(
        :reviewer_name,
        :reviewer_rank,
        :deadline
      )

      @review = @game.reviews.create(attributes)
      redirect_to @game
  end

end
