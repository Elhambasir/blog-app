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
      expect(response.body).to include('Here are list of all posts for given user')
    end
  end

  context 'GET /show' do
    it 'returns http success' do
      get "/users/#{@user.id}/posts/show"
      expect(response).to have_http_status(:success)
      expect(response.status).to eq(200)
    end

    it 'render the show template' do
      get "/users/#{@user.id}/posts/show"
      expect(response).to render_template('posts/show')
    end

    it 'includes the correct placeholder text' do
      get "/users/#{@user.id}/posts/show"
      expect(response.body).to include('list a post for given user id and given post id')
    end
  end

  context 'POST /new' do
    it 'returns http success' do
      post "/users/#{@user.id}/posts/new/", params: @User
      expect(response).to have_http_status(:success)
      expect(response.status).to eq(200)
    end

    it 'render the new template' do
      post "/users/#{@user.id}/posts/new/", params: @User
      expect(response).to render_template('posts/new')
    end

    it 'includes the correct placeholder text' do
      post "/users/#{@user.id}/posts/new/", params: @User
      expect(response.body).to include('Create posts')
    end
  end

  context 'POST /edit' do
    it 'returns http success' do
      post "/users/#{@user.id}/posts/edit/#{@post.id}", params: @User
      expect(response).to have_http_status(:success)
      expect(response.status).to eq(200)
    end

    it 'render the edit template' do
      post "/users/#{@user.id}/posts/edit/#{@post.id}", params: @User
      expect(response).to render_template('posts/edit')
    end

    it 'includes the correct placeholder text' do
      post "/users/#{@user.id}/posts/edit/#{@post.id}", params: @User
      expect(response.body).to include('Edit posts')
    end
  end
end
