class LinkReviewToReviewer < ActiveRecord::Migration
  def change
      add_reference :reviews, :user, index: true, foreign_key: true, null: false, default: 1
      change_column_default :reviews, :user_id, nil
      remove_column :reviews, :reviewer_name, :string, null: false, default: 'Fujiwara no Sai', index: true
  end
end
