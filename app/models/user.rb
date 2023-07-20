class User < ApplicationRecord
  has_many :posts, foreign_key: :author_id
  has_many :comments, foreign_key: :author_id
  has_many :likes, foreign_key: :author_id
  has_many :liked_posts, through: :likes, source: :post
  validates :name, presence: true
  validates :photo, presence: true
  validates :bio, presence: true

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end