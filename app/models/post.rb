class Post < ApplicationRecord
  has_many :likes
  has_many :comments

  belongs_to :author, class_name: 'User'

  after_save :post_counter

  private

  def post_counter
    author.increment!(:posts_counter)
  end

  def recent_comments
    comments.oder(created_at: :desc).limit(5)
  end
end
