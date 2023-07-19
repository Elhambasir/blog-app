class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post, counter_cache: :like_counter

  # A method that updates the likes counter for a post.
  def self.update_like_counter(post_id)
    post = Post.find(post_id)
    post.update(like_counter: post.likes.count)
  end
end
