class WelcomeController < ApplicationController
  def index
      # pagination schmagination
      @all = Game.all.includes(:reviews).order(created_at: :desc)
  end
end
