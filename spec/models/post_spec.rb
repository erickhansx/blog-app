require 'rails_helper'

RSpec.describe Post, type: :model do
  test_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
  subject { Post.create(author_id: test_user.id, title: 'Hello', text: 'This is my first post') }
  before { subject.save }

  it 'title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'expect title to be <= 250 characters' do
    subject.title = 'e' * 251
    expect(subject).to_not be_valid
  end

  it 'expect posts_count to be >= 0 and an integer' do
    expect(subject.comments_counter).to be >= 0
  end

  it 'expect posts_count to be >= 0 and an integer' do
    expect(subject.comments_counter).to be_kind_of Integer
  end

  it 'increment the posts_count with posts_increment' do
    puts subject.user
    subject.user = test_user
    subject.posts_increment
    test_user.save
    expect(test_user.reload.posts_count).to eql 1
  end
end
