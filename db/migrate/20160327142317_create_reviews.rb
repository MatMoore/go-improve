class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.belongs_to :game, index: true
      t.string :reviewer_name, null: false
      t.string :reviewer_rank, null: false
      t.date :deadline, null: false
      t.string :sgf_contents

      t.timestamps null: false
    end
  end
end
