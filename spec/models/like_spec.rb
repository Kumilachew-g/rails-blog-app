require 'rails_helper'

RSpec.describe Like, type: :model do
  subject do
    Like.new(
      post: Post.new(
        user: User.new(
          name: 'Haddis', photo: 'https://unsplash.com/photos/-rwqO6Jvo_M',
          bio: 'Teacher from AASTU.',
          posts_counter: 0
        ), title: 'Java', text: 'This is my first post',
        likes_counter: 0, comments_counter: 0
      ),
      user: User.new(name: 'Haddis', photo: 'https://unsplash.com/photos/-rwqO6Jvo_M', bio: 'Teacher from AASTU.',
                     posts_counter: 0)
    )
  end

  before { subject.save }

  it 'comments_counter should return a right result when calling it with after_save' do
    expect(subject.post.likes_counter).to eq(1)
  end
end
