RSpec.feature 'PostIndex', type: :feature do
  before(:each) do
    @user2 = User.create(name: 'Leslie', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Russia')
    @first_post = Post.create(author_id: @user2.id, title: 'My post', text: 'This is my first post',
                              comments_counter: 0, likes_counter: 0)
    Comment.create(post_id: @first_post.id, author_id: @user2.id, text: 'This the first post comment')

    visit user_post_path(@user2.id, @first_post)
  end

  scenario 'User can see the post\'s title' do
    expect(page).to have_content(@first_post.title)
  end

  scenario 'User can see the post\'s author' do
    expect(page).to have_content(User.find(@first_post.author_id).name)
  end

  scenario 'User can see how many comments a post has' do
    expect(page).to have_content(@first_post.comments_counter)
  end

  scenario 'User can see how many likes a post has' do
    expect(page).to have_content(@first_post.likes_counter)
  end

  scenario 'User can see some of the post\'s body' do
    expect(page).to have_content(@first_post.text)
  end

  scenario 'User can see the username of each commenter' do
    @user2.posts.each do |post|
      post.comments.each do |comment|
        commenter = User.find(comment.author_id)
        expect(page).to have_content(commenter.name)
      end
    end
  end

  scenario 'User can see the username of each commenter' do
    @user2.posts.each do |post|
      post.comments.each do |comment|
        expect(page).to have_content(comment.text)
      end
    end
  end
end
