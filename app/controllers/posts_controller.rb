class PostsController < ApplicationController
  def index
    @posts = Post.all.order(:updated_at).reverse_order
    render json: @posts, status: :ok
  end

  def show
    @post = Post.find_by_id(params[:id])
    render json: @post, status: :ok
  end
end
