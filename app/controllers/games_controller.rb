class GamesController < ApplicationController
    respond_to :html
    before_action :authenticate_user!, only: [:new, :create]

    def new
        @game_form = GameForm.new
    end

    def create
        @game_form = GameForm.new(params[:game_form])
        if @game_form.save(current_user)
            redirect_to game_path(@game_form.game)
        else
            render :new
        end
    end

    def show
        @game = Game.find(params[:id])
        @in_progress = @game.reviews.where(sgf_contents: nil).order(created_at: :desc)
        @completed = @game.reviews.where.not(sgf_contents: nil).order(created_at: :desc)
    end

end
