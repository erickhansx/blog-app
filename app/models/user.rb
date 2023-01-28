class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id'
  validates :name, presence: true
  validates :posts_count, numericality: { greater_than_or_equal_to: 0, only_integer: true }

  def recent
    posts.order(created_at: :desc).limit(3)
  end
end
