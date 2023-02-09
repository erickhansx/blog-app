require 'rails_helper'

RSpec.feature 'PostIndex', type: :feature do
  before(:each) do
    @user2 = User.create(name: 'Leslie', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Russia')
    @first_post = Post.create(author_id: @user2.id, title: 'My post', text: 'This is my first post',
                              comments_counter: 0, likes_counter: 0)
    Comment.create(post_id: @first_post.id, author_id: @user2.id, text: 'This the first post comment')
    visit user_posts_path(@user2.id)
  end

  scenario 'User can see the profile picture for each user' do
    expect(page).to have_css("img[src='#{@user2.photo}']")
  end
  scenario 'User can see the username of all the other users' do
    expect(page).to have_content(@user2.name)
  end
  scenario 'User can see the number of posts each user has written' do
    expect(page).to have_content('Number of posts:1')
  end
  scenario 'User can see the post\'s title' do
    expect(page).to have_content(@first_post.title)
  end
  scenario 'User can see some of the post\'s body' do
    expect(page).to have_content(@first_post.text[0..15])
  end
  scenario 'User can see the first comments on a post' do
    expect(page).to have_content(@first_post.comments.first.text)
  end
  scenario 'User can see how many comments a post has' do
    expect(page).to have_content(@first_post.comments_counter)
  end
  scenario 'User can see how many likes a post has' do
    expect(page).to have_content(@first_post.likes_counter)
  end
  scenario 'User cannot see pagination' do
    expect(page).not_to have_content('Pagination')
  end
  scenario "User click on a post, it should redirect to that post's show page" do
    click_link(@first_post.title)
    expect(page).to have_current_path(user_post_path(@user2, @first_post))
  end
end
