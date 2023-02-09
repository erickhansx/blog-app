require 'rails_helper'

RSpec.feature 'UserShow', type: :feature do
  before(:each) do
    @user = User.create(name: 'Leslie', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Russia')
    Post.create(author_id: @user.id, title: 'My first post', text: 'This is my first post')
    Post.create(author_id: @user.id, title: 'My second post', text: 'This is my second post')
    Post.create(author_id: @user.id, title: 'My third post', text: 'This is my third post')
    Post.create(author_id: @user.id, title: 'My fourth post', text: 'This is my fourth post')
    visit user_path(@user.id)
  end

  scenario 'User can see the profile picture for each user' do
    expect(page).to have_css("img[src='#{@user.photo}']")
  end

  scenario 'User can see the username of all the other users' do
    expect(page).to have_content(@user.name)
  end

  scenario 'User can see the number of posts each user has written' do
    expect(page).to have_content('Number of posts:4')
  end

  scenario 'User can see user\'s bio' do
    expect(page).to have_content(@user.bio)
  end

  scenario 'User can see user\'s recent posts' do
    visit user_path(@user)
    expect(page).to have_content('This is my second post')
    expect(page).to have_content('This is my third post')
    expect(page).to have_content('This is my fourth post')
  end

  scenario 'User can see user\'s recent posts' do
    expect(page).to have_content('See All Posts')
  end

  scenario "When I click to see all posts it redirect me to the user's post's index page" do
    click_link('See All Posts')
    expect(page).to have_current_path(user_posts_path(@user))
  end
end
