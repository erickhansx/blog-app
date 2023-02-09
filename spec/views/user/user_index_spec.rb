require 'rails_helper'

RSpec.feature 'UserIndex', type: :feature do
  before(:each) do
    @user1 = User.create(name: 'Erick', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                         bio: 'Teacher from CyberSpace', posts_count: 1)
    @user2 = User.create(name: 'Leslie', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Russia',
                         posts_count: 2)
    visit users_path
  end

  scenario 'User can see the username of all the other users' do
    expect(page).to have_content(@user1.name)
    expect(page).to have_content(@user2.name)
  end

  scenario 'User can see the profile picture for each user' do
    expect(page).to have_css("img[src='#{@user1.photo}']")
    expect(page).to have_css("img[src='#{@user2.photo}']")
  end

  scenario 'User can see the number of posts each user has written' do
    expect(page).to have_content('Number of posts: 1')
    expect(page).to have_content('Number of posts: 2')
  end

  scenario 'User can click on a user and be redirected to that user\'s show page' do
    first('.user-link').click
    expect(current_path).to eq(user_path(@user1.id))
  end
end
