class FixUsersId < ActiveRecord::Migration[7.0]
  def change
    rename_column :posts, :users_id, :user_id
    rename_column :likes, :users_id, :user_id
    rename_column :comments, :users_id, :user_id
  end
end
