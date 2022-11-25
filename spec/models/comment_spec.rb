require 'rails_helper'

RSpec.describe Comment, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  describe 'comment model methods' do
    subject do
      Comment.new
    end

    before {subject.save}

    it "title presence" do
      subject.text = nil
      expect(subject).to_not be_valid
    end
  end
end
