require 'rails_helper'

RSpec.describe 'User show page', type: :feature do
  describe 'Show page for Hana' do
    before(:each) do
      @hana = User.create(name: 'Hana', photo: 'https://allaboutethio.com/images/ethiopian-traditional-clothes-habesha-kemise-7.jpg',
                          bio: 'Teacher from DM')
      @hello = Post.create(user: @hana, title: 'Hello', text: 'This is my first post')
      Post.create(user: @hana, title: 'Hey', text: 'This is my second post')
      Post.create(user: @hana, title: 'Hay', text: 'This is my third post')
    end

    it "Shows the user's profile picture" do
      visit user_path(@hana)
      expect(page).to have_css('img[src*="ethiopian-traditional-clothes-habesha-kemise-7"]')
      expect(page).to_not have_css('img[src*="ethiopian-traditional-clothes-habesha-kemise-8"]')
    end

    it "Show the user's username" do
      visit user_path(@hana)
      expect(page).to have_content('Hana')
      expect(page).to_not have_content('hewan')
    end

    it 'Shows the number of posts the user has written' do
      visit user_path(@hana)
      expect(page).to have_content('Number of posts: 3')
      expect(page).to_not have_content('Number of posts: 0')
    end

    it "Show the user's bio" do
      visit user_path(@hana)
      expect(page).to have_content('Teacher from DM')
      expect(page).to_not have_content('Teacher from Bahr Dar')
    end

    it "Show the user's first 3 posts" do
      visit user_path(@hana)
      expect(page).to have_content('This is my first post')
      expect(page).to have_content('This is my second post')
      expect(page).to_not have_content("This is Hana's first post")
      expect(page).to have_content('This is my third post')
      expect(page).to have_content('Hey')
      expect(page).to_not have_content('Hi')
    end

    it "When I click a user's post, it redirects me to that post's show page" do
      visit user_path(@hana)
      click_link 'Hello'
      expect(current_path).to eq user_post_path(@hana, @hello)
    end
  end

  describe 'Show page for Hewan' do
    before(:each) do
      @hewan = User.create(name: 'Hewan', photo: 'https://cdn.shopify.com/s/files/1/2447/6309/products/nyala-traditional-ethiopian-clothing-clothes-habesha-dress-white-green-lawn-lady-formal-wear_398/ethiopian-traditional-clothes-habesha-kemise-7.jpg',
                           bio: 'Teacher from Addis Ababa')
      Post.create(user: @hewan, title: 'Hi one', text: "This is hewan's first post")
      Post.create(user: @hewan, title: 'Hi two', text: "This is hewan's second post")
      @hi_three = Post.create(user: @hewan, title: 'Hi three', text: "This is hewan's third post")
      Post.create(user: @hewan, title: 'Hi four', text: "This is hewan's fourth post")
      Post.create(user: @hewan, title: 'Hi five', text: "This is hewan's fifth post")
    end

    it "Shows the user's profile picture" do
      visit user_path(@hewan)
      expect(page).to have_css('img[src*="ethiopian-traditional-clothes-habesha-kemise-7"]')
      expect(page).to_not have_css('img[src*="ethiopian-traditional-clothes-habesha-kemise-8"]')
    end

    it "Show the user's username" do
      visit user_path(@hewan)
      expect(page).to have_content('hewan')
      expect(page).to_not have_content('Lilly')
    end

    it 'Shows the number of posts the user has written' do
      visit user_path(@hewan)
      expect(page).to have_content('Number of posts: 5')
      expect(page).to_not have_content('Number of posts: 0')
    end

    it "Show the user's bio" do
      visit user_path(@hewan)
      expect(page).to have_content('Teacher from Addis Ababa')
      expect(page).to_not have_content('Teacher from Bahr Dar')
    end

    it "Show the user's first 3 posts" do
      visit user_path(@hewan)
      expect(page).to have_content("This is hewan's fifth post")
      expect(page).to have_content("This is hewan's fourth post")
      expect(page).to have_content("This is hewan's third post")
      expect(page).to_not have_content("This is hewan's second post")
      expect(page).to_not have_content("This is hewan's first post")
      expect(page).to have_content('Hi five')
      expect(page).to have_content('Hi four')
      expect(page).to have_content('Hi three')
      expect(page).to_not have_content('Hi two')
      expect(page).to_not have_content('Hi one')
    end

    it "When I click a user's post, it redirects me to that post's show page" do
      visit user_path(@hewan)
      click_link 'Hi three'
      expect(current_path).to eq user_post_path(@hewan, @hi_three)
    end
  end
end
