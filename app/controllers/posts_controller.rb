class PostsController < ApplicationController
  before_action :authenticate_user!, except: %i[ index show ]

  def index 
    @posts = Post.order("updated_at desc")

    if !@posts.empty?
      respond('index', data: @posts)
    else
      respond('index', data: nil, status_code: :not_found)
    end

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
    else
      redirect_to new_post_url, alert: "Gagal menambahkan post baru"
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
    @posts = user.posts.all.order("updated_at desc")
    
    if !@posts.empty?
      respond('user_posts', data: @posts)
    else
      respond('user_posts', data: nil, status_code: :not_found)
    end
  end

  private

  def posts_params
    params.permit(:title, :body)
  end

  def respond(path, data: [], **args)
    if args[:status_code]
      status_code = args[:status_code]
    end
    respond_to do | format |
      format.html { render path }
      format.json { render json: { data: data }, status: status_code }
    end
  end
end
