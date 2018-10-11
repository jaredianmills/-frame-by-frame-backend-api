class Api::V1::CommentsController < ApplicationController
  before_action :find_comment, only: [:show, :update]

  def index
    @comments = Comment.all
    render json: @comments
  end

  def show
    render json: @comment
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      render json: @comment
      ActionCable.server.broadcast 'comments_channel', json: @comment
    else
      render json: {errors: "There was an error creating your comment"}
    end
  end

  def update
    @comment.update(comment_params)
    if @comment.save
      render json: @comment, status: :accepted
    else
      render json: { errors: @comment.errors.full_messages }, status: :unprocessible_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :note_id, :content)
  end

  def find_comment
    @comment = Comment.find(params[:id])
  end
end
