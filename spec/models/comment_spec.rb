require 'rails_helper'

RSpec.describe Comment, type: :model do
  test_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') 
  test_post = Post.create( author_id: test_user.id, title: 'Hello', text: 'This is my first post' )
  subject { Comment.create(post_id: test_post.id, author_id: test_user, text: 'Hi Tom!' ) }

  it 'increments the likes_counter on the associated post by 1' do
    subject.comment_count
    expect(test_post.reload.comments_counter).to eql 1
  end

end