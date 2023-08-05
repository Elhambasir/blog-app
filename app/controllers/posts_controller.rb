class PostsController < ApplicationController
  load_and_authorize_resource
  before_action :find_user, only: %i[index show new edit create]
  def index
    @posts = @user.posts.includes(:comments).order(created_at: :asc)
  end

  def show
    @post = @user.posts.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit; end

  def create
    @post = Post.new(post_params)
    @post.author = current_user

    if @post.save
      redirect_to user_posts_path(current_user), notice: 'Post created successfully'
    else
      flash.now[:alert] = @post.errors.full_messages.first if @post.errors.any?
      render :new, status: 400
    end
  end

  def destroy
    @post = Post.find(params[:id])

    if @post.destroy
      redirect_to user_posts_path(current_user), notice: 'Post deleted successfully'
    else
      flash.new[:alert] = @post.errors.full_messages.first if @post.errors.any?
      render :show, status: 400
    end
  end
end
