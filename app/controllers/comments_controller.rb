class CommentsController < ApplicationController
  before_action :authenticate_user!, except: %i[ index show ]

  def create
    @comment = Comment.create(comments_params.merge(user_id: current_user.id))
    if @comment.valid?
      redirect_to post_path(@comment.post_id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update 
    @comment = Comment.find(params[:id]);
    if @comment.update(comments_params)
      redirect_to post_path(@comment.post_id)
    end
  end

  def edit 
    @comment = Comment.find(params[:id])
  end

  def destroy 
    @comment = Comment.find(params[:id])
    if @comment.present?
      @comment.destroy
      redirect_to posts_path
    end
  end

  private

  def comments_params 
    params.require(:comment).permit(:body, :post_id)
  end
end
