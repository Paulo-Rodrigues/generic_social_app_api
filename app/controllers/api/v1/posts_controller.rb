class Api::V1::PostsController < ActionController::API
  before_action :find_post, only: [:show, :update, :destroy]

  def index
    @posts = Post.all

    render json: @posts, status: :ok
  end

  def show
    render json: @post, status: :ok
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      render json: @post, status: :created
    else
      render json: @post.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    
    if @post.update(post_params)
      render json: @post, status: :ok
    else
      render json: @post.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    render json: {head: :no_content}, status: :no_content
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :description)
  end
end
