class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, foreign_key: :post_id
  has_many :likes, foreign_key: :post_id
  has_many :users, through: :likes

  after_save :update_post_counter

  # A method that updates the posts counter for a user.
  def update_post_counter
    author.increment!(:post_counter)
  end

  # A method which returns the 5 most recent comments for a given post.
  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
