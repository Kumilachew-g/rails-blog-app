require 'rails_helper'

RSpec.describe 'User post index page', type: :feature do
  describe 'Show page for Hana' do
    before(:each) do
      @hana = User.create(name: 'Hana', photo: 'https://cdn.shopify.com/s/files/1/2447/6309/products/E0A9186_2048x/ethiopian-clothe1.jpg?v=1622452326',
                          bio: 'Teacher from Dejen')
      @tana = User.create(name: 'Tana', photo: 'https://i0.wp.com/habeshakemise.com/wp-content/uploads/2019/06/amarech-ethiopian-traditional-dress-21-1/ethiopian-clothe2.jpg?fit=768%2C1018&ssl=1',
                          bio: 'Teacher from DM.')
      @jemal = User.create(name: 'Jemal', photo: 'https://i0.wp.com/habeshakemise.com/wp-content/uploads/2019/06/fidel-fiker-ethiopian-traditional-clothes-87.jpg?fit=541%2C1024&ssl=1',
                           bio: 'Teacher from Amber.')
      @belete = User.create(name: 'Belete', photo: 'https://i.pinimg.com/originals/8e/b3/4c/8eb34cd010e03920a1aba259ac78a3ef.jpg',
                            bio: 'Teacher from Dessie.')
      @hello = Post.create(user: @hana, title: 'Hello', text: 'This is my first post')
      Post.create(user: @hana, title: 'Hey', text: 'This is my second post')
      Comment.create(post: @hello, user: @tana, text: 'First comment')
      Comment.create(post: @hello, user: @hana, text: 'Second comment')
      Comment.create(post: @hello, user: @jemal, text: 'Third comment')
      Comment.create(post: @hello, user: @belete, text: 'Fourth comment')
      Comment.create(post: @hello, user: @tana, text: 'Fifth comment')
      Like.create(post: @hello, user: @belete)
      Like.create(post: @hello, user: @jemal)
      Like.create(post: @hello, user: @tana)
    end

    it "Shows the user's profile picture" do
      visit user_posts_path(@hana)
      expect(page).to have_css('img[src*="ethiopian-clothe1"]')
      expect(page).to_not have_css('img[src*="ethiopian-clothe2"]')
    end

    it "Show the user's username" do
      visit user_posts_path(@hana)
      expect(page).to have_content('Hana')
      expect(page).to_not have_content('Luna')
    end

    it 'Shows the number of posts the user has written' do
      visit user_posts_path(@hana)
      expect(page).to have_content('Number of posts: 2')
      expect(page).to_not have_content('Number of posts: 0')
    end

    it "Show a post's title" do
      visit user_posts_path(@hana)
      expect(page).to have_content('Hello')
      expect(page).to have_content('Hey')
      expect(page).to_not have_content('Hi')
    end

    it "Show some of the post's body" do
      visit user_posts_path(@hana)
      expect(page).to have_content('This is my first post')
      expect(page).to have_content('This is my second post')
      expect(page).to_not have_content('This is my third post')
    end

    it 'Show the first comments on a post' do
      visit user_posts_path(@hana)
      expect(page).to have_content('First comment')
    end

    it 'Show how many comments a post has' do
      visit user_posts_path(@hana)
      expect(page).to have_content('Comments: 5')
    end

    it 'Show how many likes a post has' do
      visit user_posts_path(@hana)
      expect(page).to have_content('Likes: 3')
    end

    it "When I click on a post, it redirects me to that post's show page" do
      visit user_posts_path(@hana)
      click_link 'Hello'
      expect(current_path).to eq user_post_path(@hana, @hello)
    end
  end
end
