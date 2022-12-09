class Api::PostsController < ApplicationController
  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      @posts = Post.where(user_id: @user.id)
      respond_to do |format|
        format.json { render json: @posts, status: :ok }
      end
    else
      respond_to do |format|
        format.json { render json: 'Please sign in or add the token', status: :ok }
      end
    end
  end

  def show
    if params[:post_id]
      @post = Post.find(params[:post_id])
      respond_to do |format|
        format.json { render json: @post, status: :ok }
      end
    else
      respond_to do |format|
        format.json { render json: 'Please sign in or add the token', status: :ok }
      end
    end
  end
end
