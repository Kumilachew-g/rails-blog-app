require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject do
    Comment.new(
      post: Post.new(
        user: User.new(
          name: 'Haddis',
          photo: 'https://unsplash.com/photos/-rwqO6Jvo_M',
          bio: 'Teacher from AASTU.',
          posts_counter: 0
        ),
        title: 'Java',
        text: 'This is my first post',
        likes_counter: 0,
        comments_counter: 0
      ),
      user: User.new(name: 'Haddis', photo: 'https://unsplash.com/photos/-rwqO6Jvo_M', bio: 'Teacher from AASTU.',
                     posts_counter: 0),
      text: 'This is the comment'
    )
  end

  before { subject.save }

  it 'update_post_comments_counter should return a right result when calling it with after_save' do
    expect(subject.post.comments_counter).to eq(1)
  end
end
