class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post, counter_cache: :comment_counter
  validates :text, presence: true

  first_post = Post.find(1)
  first_user = User.find_by(name: 'Tom')
  second_user = User.find(5)

  Comment.create(post: first_post, author: second_user, text: 'Hi Tom!')
  Comment.create(post: first_post, user: second_user, text: 'Your post is nice!')
  Comment.create(post: first_post, user: first_user, text: 'Perfect')
  Comment.create(post: first_post, user: first_user, text: 'I liked your post')
  Comment.create(post: first_post, user: second_user, text: 'I love your post')
  Comment.create(post: first_post, user: first_user, text: 'You look great!')


  # A method that updates the comments counter for a post.
  def self.update_comment_counter(post_id)
    post = Post.find(post_id)
    post.update(comment_counter: post.comments.count)
  end
end
