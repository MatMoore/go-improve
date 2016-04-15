class WelcomeController < ApplicationController
  def index
      # pagination schmagination
      @all = Game.all.includes(:reviews).order(created_at: :desc)

      if user_signed_in?
          @mine = Game.where(
              "exists(select 1 from reviews where user_id=? and game_id=games.id) or games.user_id=?",
              current_user.id,
              current_user.id,
          ).order(created_at: :desc)
      else
          @mine = Game.none
      end
  end

  def review
  end
end
