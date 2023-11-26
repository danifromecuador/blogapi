class PostsController < ApplicationController
  def index
    posts = Post.all.order(:updated_at).reverse_order
    if posts.empty?
      render json: 'No posts found', status: :not_found
    else
      render json: @posts, status: :ok
    end
  end

  def show
    post = Post.find_by_id(params[:id])
    if post.nil?
      render json: 'Post not found', status: :not_found
    else
      render json: @post, status: :ok
    end
  end

  def create
    post = Post.create(create_params)
    if post.valid?
      render json: 'Post created', status: :created
    else
      error_messages = []
      post.errors.messages.each do |m|
        error_messages << m.join(' ')
      end
      render json: error_messages, status: :bad_request
    end
  end

  def update
    post = Post.find_by_id(params[:id])
    if post.nil?
      render json: 'Post not found', status: :not_found
    else
      post.update(update_params)
      render json: 'Post updated', status: :ok
    end
  end

  def destroy
    post = Post.find_by_id(params[:id])
    if post.nil?
      render json: 'Post not found', status: :not_found
    else
      post.destroy
      render json: 'Post deleted', status: :ok
    end
  end

  private

  def create_params
    params.permit(:user_id, :title, :content)
  end

  def update_params
    params.permit(:title, :body)
  end
end
