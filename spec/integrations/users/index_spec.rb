require 'rails_helper'

RSpec.describe 'User Index Page', type: :system do
  before(:each) do
    @user = User.create(name: 'Doraemon & Nobita', photo: 'https://media.istockphoto.com/id/1406197730/photo/portrait-of-a-young-handsome-indian-man.webp?b=1&s=170667a&w=0&k=20&c=KtmKHyOE6MJV0w2DiGX8P4399KHNbZ3p8lCjTEabGcY=', bio: 'Best friends', posts_counter: 12)
    @user.posts.create(title: 'Post 1', text: 'This is the first post.', comments_counter: 0, likes_counter: 0)
    @user.posts.create(title: 'Post 2', text: 'This is the second post.', comments_counter: 0, likes_counter: 0)
    @user.posts.create(title: 'Post 3', text: 'This is the third post.', comments_counter: 0, likes_counter: 0)
  end

  describe 'User index page' do
    before(:each) { visit users_path }

    it 'displays a container for the users' do
      expect(page).to have_css('div.container')
    end

    it 'displays the username of each user' do
      expect(page).to have_content(@user.name)
    end

    it 'displays the photos of each user' do
      User.all.each do |user|
        expect(page.has_xpath?("//img[@src = '#{user.photo}' ]"))
      end
    end

    it 'shows the number of posts of each user' do
      User.all.each do |user|
        expect(page).to have_content("Number of posts: #{user.posts_counter}")
      end
    end

    it "is redirected to that user's show page" do
      User.all.each do |user|
        click_link(user.name)
        sleep(5)
        expect(page).to have_current_path(user_path(user))
      end
    end
  end
end
