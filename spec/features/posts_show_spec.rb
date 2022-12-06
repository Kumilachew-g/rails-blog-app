require 'rails_helper'

RSpec.describe 'Post show page', type: :feature do
  describe 'Show page for Hana' do
    before(:each) do
      @hana = User.create(name: 'Hana', photo: 'https://i.pinimg.com/736x/84/b7/0b/84b70bda44dc5bbc7216dc4e58accd6e.jpg',
                          bio: 'Teacher from Lumame')
      @belachew = User.create(name: 'Belachew', photo: 'https://i.pinimg.com/736x/1d/3c/ed/1d3cedbc24089564c1c7333ae6ef9121.jpg',
                              bio: 'Teacher from Addis.')
      @abebe = User.create(name: 'Abebe', photo: 'https://allaboutethio.com/images/ethiopian-traditional-clothes-habesha-kemise-14.jpg',
                           bio: 'Teacher from DM.')
      @hewan = User.create(name: 'Hewan', photo: 'https://www.thehabeshaweb.com/wp-content/uploads/2021/01/photo_2020-12-30_11-21-04.jpg',
                           bio: 'Teacher from Addis Ababa.')
      @hello = Post.create(user: @hana, title: 'Hello', text: 'This is my first post')
      Comment.create(post: @hello, user: @belachew, text: 'First comment')
      Comment.create(post: @hello, user: @hana, text: 'Second comment')
      Comment.create(post: @hello, user: @abebe, text: 'Third comment')
      Comment.create(post: @hello, user: @hewan, text: 'Fourth comment')
      Comment.create(post: @hello, user: @belachew, text: 'Fifth comment')
      Like.create(post: @hello, user: @hewan)
      Like.create(post: @hello, user: @abebe)
      Like.create(post: @hello, user: @belachew)
    end

    it "Shows the post's title" do
      visit user_post_path(@hana, @hello)
      expect(page).to have_content('Hello')
      expect(page).to_not have_content('Hey')
    end

    it 'Show who wrote the post' do
      visit user_post_path(@hana, @hello)
      expect(page).to have_content('by Hana')
      expect(page).to_not have_content('by Luna')
    end

    it 'Shows how many comments it has' do
      visit user_post_path(@hana, @hello)
      expect(page).to have_content('Comments: 5')
      expect(page).to_not have_content('Comments: 3')
    end

    it 'Show how many likes it has' do
      visit user_post_path(@hana, @hello)
      expect(page).to have_content('Likes: 3')
      expect(page).to_not have_content('Likes: 5')
    end

    it "Show some of the post's body" do
      visit user_post_path(@hana, @hello)
      expect(page).to have_content('This is my first post')
      expect(page).to_not have_content('This is my second post')
    end

    it 'Show the username of each commentor' do
      visit user_post_path(@hana, @hello)
      expect(page).to have_content('Belachew')
      expect(page).to have_content('Hana')
      expect(page).to have_content('Hewan')
      expect(page).to have_content('Abebe')
    end

    it 'Show the comment each commentor left' do
      visit user_post_path(@hana, @hello)
      expect(page).to have_content('First comment')
      expect(page).to have_content('Second comment')
      expect(page).to have_content('Third comment')
      expect(page).to have_content('Fourth comment')
      expect(page).to have_content('Fifth comment')
    end
  end
end
