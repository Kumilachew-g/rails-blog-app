class Post < ApplicationRecord
  has_many :likes, dependent: :delete_all
  has_many :comments, dependent: :delete_all
  belongs_to :user

  after_save :update_post_user_counter

  validates :title, presence: true, length: { maximum: 250 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def update_post_user_counter
    user.increment!(:posts_counter)
  end

  def five_most_recent_comments
    comments.includes(:user).order(created_at: :desc).first(5)
  end
end
