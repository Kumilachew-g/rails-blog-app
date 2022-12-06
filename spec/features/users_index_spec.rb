require 'rails_helper'

RSpec.describe 'User index page', type: :feature do
  describe 'Index page for Hana' do
    before(:each) do
      @hana = User.create(name: 'Hana', photo: 'https://i.pinimg.com/originals/37/af/26/37af26866618102a73b38b189265d8e3/ethiopian-cultural-closeup1.jpg',
                          bio: 'Teacher from Ethiopia')
      Post.create(user: @hana, title: 'Hello', text: 'This is my first post')
      Post.create(user: @hana, title: 'Hey', text: 'This is my second post')
    end

    it 'Show the user index view path' do
      visit root_path
      expect(page).to have_xpath('/')
    end

    it 'Show the username of all other users' do
      visit root_path
      expect(page).to have_content('Hana')
      expect(page).to_not have_content('Luna')
    end

    it 'Shows the profile picture for each user' do
      visit root_path
      expect(page).to have_css('img[src*="ethiopian-cultural-closeup1"]')
      expect(page).to_not have_css('img[src*="ethiopian-cultural-closeup2"]')
    end

    it 'Shows the number of posts each user has written' do
      visit root_path
      expect(page).to have_content('Number of posts: 2')
      expect(page).to_not have_content('Number of posts: 1')
    end

    it "When I click on a user, I am redirected to that user's show page" do
      visit root_path
      click_link 'Hana'
      expect(current_path).to eq user_path(@hana)
    end
  end

  describe 'Index page for Kumilachew' do
    before(:each) do
      @kumie = User.create(name: 'Kumilachew', photo: 'https://allaboutethio.com/images/ethiopian-traditional-clothes-habesha-kemise-57/ethiopian-cultural-closeup1.jpg',
                           bio: 'Teacher from Addis Ababa')
      Post.create(user: @kumie, title: 'Hi', text: 'This is my first post')
    end

    it 'Show the username of all other users' do
      visit root_path
      expect(page).to have_content('Kumilachew')
      expect(page).to_not have_content('Hana')
    end

    it 'Shows the profile picture for each user' do
      visit root_path
      expect(page).to have_css('img[src*="ethiopian-cultural-closeup1"]')
      expect(page).to_not have_css('img[src*="ethiopian-cultural-closeup2"]')
    end

    it 'Shows the number of posts each user has written' do
      visit root_path
      expect(page).to have_content('Number of posts: 1')
      expect(page).to_not have_content('Number of posts: 2')
    end

    it "When I click on a user, I am redirected to that user's show page" do
      visit root_path
      click_link 'Kumilachew'
      expect(current_path).to eq user_path(@kumie)
    end
  end
end
