class PostsController < ApplicationController
  def index; end

  def show
    @post = User.find(params[:user_id]).posts.find(params[:id])
  end
end
