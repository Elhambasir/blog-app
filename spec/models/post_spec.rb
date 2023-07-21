require 'rails_helper'
RSpec.describe Post, type: :model do
  subject(:user) { User.create(name: 'Elham', photo: 'https://i.pravatar.cc/300?u=elham', bio: 'I am a software engineer.', posts_counter: 0) }
  subject(:post) do
    user.posts.create(title: 'Post 1', text: 'This is the first post.', comments_counter: 0, likes_counter: 0)
  end
  # Author must be a valid user.
  it 'is invalid if author is not a valid user' do
    post.author_id = 0
    expect(post).to_not be_valid
  end
  # Title must be less than or equal to 250 characters.
  it 'is invalid if title is more than 250 characters' do
    post.title = 'a' * 251
    expect(post).to_not be_valid
  end
  # Title must not be blank.
  it 'is invalid without a title' do
    post.title = nil
    expect(post).to_not be_valid
  end
  # Text must not be blank.
  it 'is invalid without a text' do
    post.text = nil
    expect(post).to_not be_valid
  end
  # LikeCounter must be an integer greater than or equal to zero.
  it 'is invalid if like_counter is not an integer' do
    post.likes_counter = 1.5
    expect(post).to_not be_valid
  end
  it 'is invalid if like_counter is less than zero' do
    post.likes_counter = -1
    expect(post).to_not be_valid
  end
  # CommentCounter must be an integer greater than or equal to zero.
  it 'is invalid if comment_counter is not an integer' do
    post.comments_counter = 1.5
    expect(post).to_not be_valid
  end
  it 'is invalid if comment_counter is less than zero' do
    post.comments_counter = -1
    expect(post).to_not be_valid
  end

  # A method which returns the 5 most recent comments for a given post.
  describe '#recent_comments' do
    it 'returns the 5 most recent comments for a given post' do
      6.times do |i|
        post.comments.create(text: "Comment #{i}", author_id: user.id)
      end
      expect(post.recent_comments.count).to eq(5)
      expect(post.recent_comments.first.text).to eq('Comment 5')
      expect(post.recent_comments.last.text).to eq('Comment 1')
    end
  end

  # A method that updates the posts counter for a user after_save.
  describe '#update_post_counter' do
    it 'updates the posts counter for a user after_save' do
      expect(User.find(user.id).posts_counter).to eq(0)
      post # call the post variable to trigger the after_save callback
      expect(User.find(user.id).posts_counter).to eq(1)
    end
  end
end
