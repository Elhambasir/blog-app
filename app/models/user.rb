class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :likes
  has_many :liked_posts, through: :likes, source: :post
  validates :name, presence: true
  validates :photo, presence: true
  validates :bio, presence: true

  User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
  User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
              bio: 'Teacher from Poland.')

  first_user = User.find_by(name: 'Tom')
  first_user.name = 'Elham'
  first_user.save

  def recent_posts(author_id)
    author = User.find(author_id)
    author.posts.order(created_at: :desc).limit(5)
  end
end
