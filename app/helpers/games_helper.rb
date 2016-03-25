module GamesHelper
    def game_title(game)
        "#{game.black_player} #{game.black_rank} vs #{game.white_player} #{game.white_rank}"
    end

    def game_subtitle(game)
        if game.review_for == :either
            "Review requested for either player"
        else
            "Review requested for #{game.review_for}"
        end
    end
end
