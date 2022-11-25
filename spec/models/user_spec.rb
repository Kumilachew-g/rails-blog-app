require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Kumie', photo: 'https://unsplash.com/photos/r-QpUNyC5Bc', bio: 'Student from Microverse.') }

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'posts_counter should be greater_than_or_equal zero' do 
   subject.posts_counter = -1
   expect(subject).to_not be_valid
 end
end
