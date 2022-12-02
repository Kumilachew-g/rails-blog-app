class CommentsController < ApplicationController
    def create
        comment = current_user.comments.new(params.require(:comment).permit(:text))
        comment.post_id = params[:post_id]
        respond_to do |format|
          format.html do
            if comment.save
              flash[:success] = "Comment saved successfully"
              redirect_to "/users/#{current_user.id}/posts"
            end
          end
        end
      end
end
