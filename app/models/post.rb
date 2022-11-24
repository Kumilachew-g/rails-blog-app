class Post < ApplicationRecord
  has_many :likes
  has_many :comments

  belongs_to :author, class_name: 'User'

  def post_counter
    author.increment!(:posts_counter)
end
end
