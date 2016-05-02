class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def new
      @game = Game.find(params[:game_id])
      @review = Review.new(reviewer_rank: current_user.rank)
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

      @review = @game.reviews.create_with(attributes).find_or_create_by(
          user: current_user,
          game: @game
      )
      @review.assign_attributes(attributes)

      if @review.valid?
          @review.save
          rank = attributes["reviewer_rank"]

          if rank != current_user.rank
              current_user.rank = rank
              current_user.save!
          end

          redirect_to @game
      else
          render :new
      end
  end

end
