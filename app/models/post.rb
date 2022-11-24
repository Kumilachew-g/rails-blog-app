class Post < ApplicationRecord
  has_many :likes
  has_many :comments

  belongs_to :author, class_name: 'User'

  after_save :update_post_user_counter

  private

  def post_counter
    author.increment!(:posts_counter)
  end

  def recent_comments
    comments.limit(5).oder(created_at: :desc)
  end
end
