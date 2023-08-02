require 'rails_helper'

RSpec.describe 'User Show Page', type: :system do
  before(:all) do
    @user = User.create(name: 'Doraemon & Nobita', 
    photo: 'https://media.istockphoto.com/id/1406197730/photo/portrait-of-a-young-handsome-indian-man.webp?b=1&s=170667a&w=0&k=20&c=KtmKHyOE6MJV0w2DiGX8P4399KHNbZ3p8lCjTEabGcY=',
    bio: 'Best friends', posts_counter: 12)
    @user.posts.create(title: 'Post 1', text: 'This is the first post.', comments_counter: 0, likes_counter: 0)
    @user.posts.create(title: 'Post 2', text: 'This is the second post.', comments_counter: 0, likes_counter: 0)
    @user.posts.create(title: 'Post 3', text: 'This is the third post.', comments_counter: 0, likes_counter: 0)
  end

  describe 'User show page' do
    before(:each) { visit user_path(id: @user.id) }

    it 'displays a container for the users' do
      expect(page).to have_css('div.container')
    end

    it "displays the user's profile picture" do
      expect(page.has_xpath?("//img[@src = '#{@user.photo}' ]"))
    end

    it "displays the user's username" do
      expect(page).to have_content(@user.name)
      expect(page).to have_link(@user.name, href: user_path(@user))
    end

    it 'shows the number of posts the user has written' do
      expect(page).to have_content("Number of posts: #{@user.posts_counter || 0}")
    end

    it "shows the user's bio" do
      expect(page).to have_content('Bio')
      expect(page).to have_content(@user.bio)
    end

    it 'shows the first 3 posts of the user' do
      @user.recent_posts.each do |post|
        expect(page).to have_content(post.id)
        expect(page).to have_content(post.title)
        expect(page).to have_content(post.text)
      end
    end

    it 'has a button to view all user posts' do
      expect(page).to have_link('See more posts', href: user_posts_path(user_id: @user.id))
    end

    it 'redirects to the post show page on clicking a user post' do
      @user.recent_posts.each do |post|
        click_link(post.title)
        expect(page).to have_current_path(user_post_path(@user, post))
      end
    end

    it 'redirects to open all posts of a user' do
      click_link('See more posts')
      expect(page).to have_current_path(user_posts_path(@user))
    end
  end
end
