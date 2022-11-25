class FixPostsId < ActiveRecord::Migration[7.0]
  def change
    rename_column :likes, :posts_id, :post_id
    rename_column :comments, :posts_id, :post_id
  end
end
