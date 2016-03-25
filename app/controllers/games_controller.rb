class GamesController < ApplicationController
    def new
    end

    def create
        attributes = permitted_params.to_h
        attributes[:sgf_contents] = "foo"
        @game = Game.new(attributes)
        @game.save
        redirect_to @game
    end

    def show
        @game = Game.find(params[:id])
    end

private

    def permitted_params
      @article = params[:game].permit(
          :review_for,
          :black_player,
          :white_player,
          :black_rank,
          :white_rank
      )
    end
end
