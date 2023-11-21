class UsersController < ApplicationController
  def index
    # GET /users
    @users = User.all.order(:updated_at).reverse_order
    render json: @users, status: :ok
  end

  def show
    # GET /users/:id
    @user = User.find_by_id(params[:id])
    render json: @user, status: :ok
  end

  def create
    # POST /users
    User.create(create_params)
    render json: 'User created', status: :created
  end

  def update
    # PATCH /users/:id
    @user = User.find_by_id(params[:id])
    @user.update(update_params)
    render json: 'User updated', status: :ok
  end

  def destroy
    # DELETE /users/:id
    @user = User.find_by_id(params[:id])
    @user.destroy
    render json: 'User deleted', status: :ok
  end

  private

  def create_params
    params.permit(:name, :email, :auth_token)
  end

  def update_params
    params.permit(:name, :email)
  end
end
