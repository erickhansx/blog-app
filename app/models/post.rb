class Post < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'author_id'
  has_many :comments
  has_many :likes
  validates :user, presence: true
  validates :title, presence: true
  validates :title, length: { maximum: 250, message: 'should be less than 250 characters' }
  validates :comments_counter, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validates :likes_counter, numericality: { greater_than_or_equal_to: 0, only_integer: true }

  def posts_increment
    return unless user

    user.increment!(:posts_count)
    puts "Incremented user's posts_count to #{user.posts_count}"
  end

  def recent
    comments.order(created_at: :desc).limit(5)
  end

  after_create :increment_posts_count

  def increment_posts_count
    puts "Incrementing posts_count for user #{user.id}"
    user.increment!(:posts_count)
    user.save
    user.reload
  end
end
