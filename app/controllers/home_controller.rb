class HomeController < ApplicationController
  def home
    @posts = 'this controller is working'
    render json: @posts
  end
end
