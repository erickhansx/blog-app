class Comment < ApplicationRecord
  belongs_to :posts, class_name: 'Post', foreign_key: 'post_id'
  belongs_to :user, class_name: 'User', foreign_key: 'author_id'

  after_create :comment_count
  def comment_count
    posts.increment!(:comments_counter)
    posts.save
    posts.reload
  end
end
