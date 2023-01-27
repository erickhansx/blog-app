class Post < ApplicationRecord
  belongs_to :user, class_name: "User", foreign_key: "author_id"
  has_many :comments
  has_many :likes
  validates :user, presence: true

  def posts_count
    user.increment(:posts_count)
  end

  def recent
    comments.order(created_at: :desc).limit(5)
  end
end