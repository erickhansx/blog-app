class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, foreign_key: 'author_id'
  has_many :likes, dependent: :destroy
  validates :name, presence: true
  validates :posts_count, numericality: { greater_than_or_equal_to: 0, only_integer: true }

  def recent
    posts.order(created_at: :desc).limit(3)
  end
end
