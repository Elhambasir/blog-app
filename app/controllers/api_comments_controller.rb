class ApiCommentsController < ActionController::API
  def index
    @comments = Comment.all
    render json: @comments
  end
  
end
