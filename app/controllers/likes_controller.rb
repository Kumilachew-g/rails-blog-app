class LikesController < ApplicationController
  def create
    like = current_user.likes.new
    like.post_id = params[:post_id]
    respond_to do |format|
      format.html do
        if like.save
          flash[:success] = 'Like saved successfully'
          redirect_to "/users/#{current_user.id}/posts"
        else
          flash.now[:error] = 'Error!: Post could not be saved'
          render :new, locals: { like: }
        end
      end
    end
  end
end
