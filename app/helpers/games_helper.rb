module GamesHelper
    def game_title(game)
        "#{present_black_player(game)} vs #{present_white_player(game)}"
    end

    def present_black_player(game)
        "#{game.black_player} #{game.black_rank}"
    end

    def present_white_player(game)
        "#{game.white_player} #{game.white_rank}"
    end

    def game_subtitle(game)
        case game.review_for
        when :black
            "Review requested for #{present_black_player(game)}"
        when :white
            "Review requested for #{present_white_player(game)}"
        else
            "Review requested for either player"
        end
    end
end
