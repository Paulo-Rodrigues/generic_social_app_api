class Api::V1::PostsController < ActionController::API
  def index
    @posts = Post.all

    render json: @posts, status: :ok
  end

  def show
    @post = Post.find(params[:id])

    render json: @post, status: :ok
  end
end
