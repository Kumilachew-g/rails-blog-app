require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Kumie', photo: 'https://unsplash.com/photos/r-QpUNyC5Bc', bio: 'Student from Microverse.') }

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
end
