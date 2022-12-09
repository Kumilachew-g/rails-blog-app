class Api::CommentsController < ApplicationController
    def index
      if request.headers['X-AUTH-TOKEN']
        @user = User.find_by_api_token(request.headers['X-AUTH-TOKEN'])
        @comments = Comment.where(user_id: @user.id)
        respond_to do |format|
          format.json { render json: @comments, status: :ok }
        end
      else
        respond_to do |format|
          format.json { render json: 'please sign in or add the token'.to_json, status: :ok }
        end
      end
    end
  
    def create
      if request.headers['X-AUTH-TOKEN']
        @user = User.find_by_api_token(request.headers['X-AUTH-TOKEN'])
        new_comment = @user.comments.new(text: params[:text])
        new_comment.post_id = params[:post_id].to_i
        if new_comment.save
          respond_to do |format|
            format.json { render json: 'Comment Saved'.to_json, status: :ok }
          end
        else
          respond_to do |format|
            format.json { render json: 'Something went wrong'.to_json, status: :ok }
          end
        end
      else
        respond_to do |format|
          format.json { render json: 'Please sign in or add the token', status: :ok }
        end
      end
    end
  end