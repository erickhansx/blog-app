class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id'

  def recent
    posts.order(created_at: :desc).limit(3)
  end
end
