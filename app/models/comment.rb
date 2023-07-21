class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post
  validates :text, presence: true

  after_save :update_comment_counter
  # A method that updates the comments counter for a post.
  def update_comment_counter
    post.increment!(:comments_counter)
  end
end
