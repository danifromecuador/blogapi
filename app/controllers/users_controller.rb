class UsersController < ApplicationController
  def index
    # GET /users
    users = User.all.order(:updated_at).reverse_order
    if users.empty?
      render json: 'No users found', status: :not_found
    else
      render json: users, status: :ok
    end
  end

  def show
    # GET /users/:id
    user = User.find_by_id(params[:id])
    if user.nil?
      render json: 'User not found', status: :not_found
    else
      render json: user, status: :ok
    end
  end

  def create
    # POST /users
    user = User.create(create_params)
    if user.valid?
      render json: 'User created successfully', status: :created
    else
      error_messages = []
      user.errors.messages.each do |m|
        error_messages << m.join(' ')
      end
      render json: error_messages, status: :bad_request
    end
  end

  def update
    # PATCH /users/:id
    user = User.find_by_id(params[:id])
    if user.nil?
      render json: 'User not found', status: :not_found
    else
      user.update(update_params)
      if user.valid?
        render json: 'User updated successfully', status: :ok
      else
        error_messages = []
        user.errors.messages.each do |m|
          error_messages << m.join(' ')
        end
        render json: error_messages, status: :bad_request
      end
    end
  end

  def destroy
    # DELETE /users/:id
    user = User.find_by_id(params[:id])
    if user.nil?
      render json: 'User not found', status: :not_found
    else
      user.destroy
      render json: 'User deleted successfully', status: :ok
    end
  end

  private

  def create_params
    params.permit(:name, :email, :auth_token)
  end

  def update_params
    params.require(:user).permit(:name, :email, :auth_token)
  end
end
