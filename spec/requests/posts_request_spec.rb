require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  before(:each) do
    @user = User.create(name: 'John Doe', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                        bio: 'Teacher from Mexico.', posts_counter: 0)
    @post = @user.posts.create(title: 'Hello World', text: 'This is my first post.', comments_counter: 0,
                               likes_counter: 0)
  end
  context 'GET /index' do
    it 'returns http success' do
      get "/users/#{@user.id}/posts/"
      expect(response).to have_http_status(:success)
      expect(response.status).to eq(200)
    end

    it 'render the index template' do
      get "/users/#{@user.id}/posts/"
      expect(response).to render_template('posts/index')
    end

    it 'includes the correct placeholder text' do
      get "/users/#{@user.id}/posts/"
      expect(response.body).to include('Number of posts:')
    end
  end

  context 'GET /show' do
    it 'returns http success' do
      get "/users/#{@user.id}/posts/#{@post.id}/"
      expect(response).to have_http_status(:success)
      expect(response.status).to eq(200)
    end

    it 'render the show template' do
      get "/users/#{@user.id}/posts/#{@post.id}/"
      expect(response).to render_template('posts/show')
    end

    it 'includes the correct placeholder text' do
      get "/users/#{@user.id}/posts/#{@post.id}/"
      expect(response.body).to include('Comments:')
    end
  end

  context 'GET /new' do
    it 'returns http success' do
      get "/users/#{@user.id}/posts/new/", params: @User
      expect(response).to have_http_status(:success)
      expect(response.status).to eq(200)
    end

    it 'render the new template' do
      get "/users/#{@user.id}/posts/new/", params: @User
      expect(response).to render_template('posts/new')
    end

    it 'includes the correct placeholder text' do
      get "/users/#{@user.id}/posts/new/", params: @User
      expect(response.body).to include('Create posts')
    end
  end
end
