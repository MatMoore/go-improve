class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

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
        :reviewer_rank,
        :deadline
      ).to_h
      attributes[:user] = current_user

      @review = @game.reviews.create(attributes)
      redirect_to @game
  end

end
