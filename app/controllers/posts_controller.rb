class PostsController < ApplicationController
  def index
    @posts = Post.all.order(:updated_at).reverse_order
    render json: @posts, status: :ok
  end

  def show
    @post = Post.find_by_id(params[:id])
    render json: @post, status: :ok
  end

  def create
    Post.create(create_params)
    render json: 'Post created', status: :created
  end

  def update
    @post = Post.find_by_id(params[:id])
    @post.update(update_params)
    render json: 'Post updated', status: :ok
  end

  def destroy
    @post = Post.find_by_id(params[:id])
    @post.destroy
    render json: 'Post deleted', status: :ok
  end

  private

  def create_params
    params.permit(:user_id, :title, :content, :published)
  end

  def update_params
    params.permit(:title, :body)
  end
end
