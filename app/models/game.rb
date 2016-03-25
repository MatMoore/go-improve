class Game < ActiveRecord::Base
    enum review_for: [:black, :white, :either]
end
