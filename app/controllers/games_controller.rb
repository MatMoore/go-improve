class GamesController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]

    def new
    end

    def create
        attributes = permitted_params.to_h
        puts attributes.inspect
        uploaded_io = attributes.delete("sgf")
        attributes[:sgf_contents] = uploaded_io.read unless uploaded_io.nil?
        attributes[:user] = current_user
        @game = Game.new(attributes)
        @game.save
        redirect_to @game
    end

    def show
        @game = Game.find(params[:id])
        @in_progress = @game.reviews.where(sgf_contents: nil).order(created_at: :desc)
        @completed = @game.reviews.where.not(sgf_contents: nil).order(created_at: :desc)
    end

private

    def permitted_params
      @article = params[:game].permit(
          :review_for,
          :black_player,
          :white_player,
          :black_rank,
          :white_rank,
          :sgf
      )
    end
end
