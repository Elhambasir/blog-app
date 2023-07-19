class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', counter_cache: :post_counter
  has_many :comments
  has_many :likes
  has_many :users, through: :likes

  first_user = User.find_by(name: 'Tom')

  Post.create(author: first_user, title: 'Hello', text: 'This is my first post')
  Post.create(author: first_user, title: 'Hello', text: 'This is my second post')
  Post.create(author: first_user, title: 'Hello', text: 'This is my third post')
  Post.create(author: first_user, title: 'Hello', text: 'This is my fourth post')

  Post.fine(1).delete

  # A method that updates the posts counter for a user.
  def self.update_post_counter(user_id)
    user = User.find(user_id)
    user.update(post_counter: user.posts.count)
  end

  # A method which returns the 5 most recent comments for a given post.
  def recent_comments(post_id)
    post = Post.find(post_id)
    post.comments.order(created_at: :desc).limit(5)
  end
end
