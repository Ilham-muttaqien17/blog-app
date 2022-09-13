class PostsController < ApplicationController
  before_action :authenticate_user!, except: %i[ index show ]

  def index 
    @posts = Post.all
  end

  def show 
    @post = Post.find(params[:id])
    @comments = @post.comments.all
    # binding.pry
  end

  def create 
    @post = Post.create(posts_params.merge(user_id: current_user.id))
    # binding.pry

    if @post.valid?
      redirect_to posts_path
    end
  end

  def update 
    @post = Post.find(params[:id])
    if @post.update(posts_params)
      redirect_to user_post_path(current_user.id)
    end
  end

  def edit 
    @post = Post.find(params[:id])
  end

  def destroy 
    @post = current_user.posts.find(params[:id])
    if @post.present?
      @post.destroy
      redirect_to posts_path
    end
  end

  def user_posts 
    user = User.find(params[:user_id])
    # binding.pry
    @posts = user.posts.all
  end

  private

  def posts_params
    params.permit(:title, :body)
  end
end
