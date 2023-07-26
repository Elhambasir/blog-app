require 'rails_helper'

RSpec.describe 'Users', type: :request do
  before(:each) do
    @user = User.create(name: 'John Doe', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                        bio: 'Teacher from Mexico.', posts_counter: 0)
  end
  context 'GET /index' do
    it 'returns http success' do
      get '/users/'
      expect(response).to have_http_status(:success)
      expect(response.status).to eq(200)
    end

    it 'render the index template' do
      get '/users/'
      expect(response).to render_template('users/index')
    end

    it 'includes the correct placeholder text' do
      get '/users/'
      expect(response.body).to include('List of users')
    end
  end

  context 'GET /show' do
    it 'returns http success' do
      get "/users/#{@user.id}"
      expect(response).to have_http_status(:success)
      expect(response.status).to eq(200)
    end

    it 'render the show template' do
      get "/users/#{@user.id}"
      expect(response).to render_template('users/show')
    end

    it 'includes the correct placeholder text' do
      get "/users/#{@user.id}"
      expect(response.body).to include('List user by id')
    end
  end

  context 'POST /new' do
    it 'returns http success' do
      post '/users/new/', params: @User
      expect(response).to have_http_status(:success)
      expect(response.status).to eq(200)
    end

    it 'render the new template' do
      post '/users/new/', params: @User
      expect(response).to render_template('users/new')
    end

    it 'includes the correct placeholder text' do
      post '/users/new/', params: @User
      expect(response.body).to include('Create new user')
    end
  end

  context 'POST /edit' do
    it 'returns http success' do
      post "/users/edit/#{@user.id}", params: @User
      expect(response).to have_http_status(:success)
      expect(response.status).to eq(200)
    end

    it 'render the edit template' do
      post "/users/edit/#{@user.id}", params: @User
      expect(response).to render_template('users/edit')
    end

    it 'includes the correct placeholder text' do
      post "/users/edit/#{@user.id}", params: @User
      expect(response.body).to include('Edit user')
    end
  end
end
