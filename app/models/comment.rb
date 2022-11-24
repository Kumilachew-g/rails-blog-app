class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User'

  after_save :comments_counter

  def comments_counter
    post.increment!(:comments_counter)
  end
end
