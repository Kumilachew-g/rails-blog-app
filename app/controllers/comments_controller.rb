class CommentsController < ApplicationController
  def create
    comment = current_user.comments.new(params.require(:comment).permit(:text))
    comment.post_id = params[:post_id]
    respond_to do |format|
      format.html do
        if comment.save
          flash[:success] = 'Comment saved successfully'
          redirect_to "/users/#{current_user.id}/posts"
        end
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:comment_id])
    @post = Post.find(@comment.post_id)
    @post.comments_counter -= 1
    @comment.destroy!
    @post.save
    flash[:success] = 'You have deleted this comment successfully!'
    redirect_to user_post_path(current_user.id, @comment.post_id)
  end
end
