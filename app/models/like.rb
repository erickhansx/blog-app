class Like < ApplicationRecord
  belongs_to :posts, class_name: "Post", foreign_key: "post_id"
  belongs_to :user, class_name: "User", foreign_key: "author_id"
  def like_count
    posts.increment(:likes_counter)
  end

end