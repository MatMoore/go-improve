class GameForm
   include ActiveModel::Model

    validates :sgf, presence: true

    MODEL_READERS = [
       :review_for,
       :black_player,
       :white_player,
       :black_rank,
       :white_rank,
    ]

    MODEL_WRITERS = MODEL_READERS.map {|field| (field.to_s + '=').to_sym}

    delegate *MODEL_READERS, to: :game
    delegate *MODEL_WRITERS, to: :game
    validate :model_valid

    attr_accessor :sgf

    def game
        @game ||= Game.new
    end

    def model_valid
        game.valid?

        MODEL_READERS.each do |field|
            game.errors[field].each do |error|
                errors[field] << error
            end
        end
    end

    def sgf=(uploaded_io)
        @sgf = uploaded_io.read unless uploaded_io.nil?
    end

    def save(current_user)
        if valid?
            game.sgf_contents = sgf
            game.user = current_user
            game.save
        end
    end
end
