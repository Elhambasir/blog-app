class PostsController < ApplicationController
  def index
    @user_id = params[:user_id]
    @posts = Post.where(author_id: @user_id)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new; end

  def edit; end
end
