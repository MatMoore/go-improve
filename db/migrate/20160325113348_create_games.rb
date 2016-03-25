class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :review_for, null: false
      t.string :black_player, null: false
      t.string :white_player, null: false
      t.string :sgf_contents, null: false
      t.string :black_rank, null: false
      t.string :white_rank, null: false

      t.timestamps null: false
    end
  end
end
