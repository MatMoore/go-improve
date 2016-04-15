class AddUserToGame < ActiveRecord::Migration
  def change
    add_reference :games, :user, index: true, foreign_key: true, null: false, default: 1
    change_column_default :games, :user_id, nil
    remove_column :games, :reviewer_name, :string, null: false, default: 'Fujiwara no Sai', index: true
  end
end
