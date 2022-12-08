class PostsController < ApplicationController
  def index
    @user = User.includes(:posts).find(params[:user_id])
  end

  def show
    @post = User.find(params[:user_id]).posts.find(params[:id])
  end

  def new
    @post = Post.new
    respond_to do |format|
      format.html { render :new, locals: { post: @post } }
    end
  end

  def create
    post = current_user.posts.new(params.require(:post).permit(:title, :text))
    respond_to do |format|
      format.html do
        if post.save
          flash[:success] = 'Post saved successfully'
          redirect_to "/users/#{current_user.id}/posts"
        else
          flash.now[:error] = 'Error: Post could not be saved'
          render :new, locals: { post: }
        end
      end
    end
  end

  def destroy
    post = Post.find(params[:id])
    user = User.find(post.user_id)
    user.posts_counter -= 1
    post.destroy
    user.save
    flash[:success] = 'You have deleted this post successfully!'
    redirect_to user_path(current_user.id)
  end
end
