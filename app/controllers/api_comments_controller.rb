class ApiCommentsController < ActionController::API
  def index
    @user = User.find(params[:user_id])
    @post = Post.where(author: @user).find(params[:post_id])
    @comments = @post.comments
    render json: @comments
  end
end
