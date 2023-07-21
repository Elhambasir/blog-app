require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject(:user) { User.create(name: 'Elham', photo: 'https://i.pravatar.cc/300?u=elham', bio: 'I am a software engineer.', posts_counter: 0) }
  subject(:post) do
    user.posts.create(title: 'Post 1', text: 'This is the first post.', comments_counter: 0, likes_counter: 0)
  end
  subject(:comment) { user.comments.create(post_id: post.id, text: 'This is the first comment.') }
  # Author must be a valid user.
  it 'is invalid if author is not a valid user' do
    comment.author_id = 0
    expect(comment).to_not be_valid
  end
  # Post must be a valid post.
  it 'is invalid if post is not a valid post' do
    comment.post_id = 0
    expect(comment).to_not be_valid
  end
  # Text must not be blank.
  it 'is invalid without a text' do
    comment.text = nil
    expect(comment).to_not be_valid
  end
  # A method that updates the comments counter for a post.
  describe '#update_comment_counter' do
    it 'updates the comments counter for a post' do
      expect(Post.find(post.id).comments_counter).to eq(0)
      comment # call the comment variable to trigger the after_save callback
      expect(Post.find(post.id).comments_counter).to eq(1)
    end
  end
end
