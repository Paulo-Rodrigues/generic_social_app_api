class Api::V1::PostsController < ActionController::API
  def index
    @posts = Post.all

    render json: @posts, status: :ok
  end
end
