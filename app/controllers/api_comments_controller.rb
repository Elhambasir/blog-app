class ApiCommentsController < ActionController::API
  before_action :set_post, only: %i[new create update]
  def index
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:post_id])
    @comments = @post.comments
    render json: @comments
  end

  def create
    @comment = Comment.new(author_id: params[:user_id].to_i, post_id: params[:post_id].to_i, text: params[:text])
    if @comment.save
      render json: @comment, status: 201
    else
      render json: { errors: @comment.errors.full_messages }, status: 400
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end
