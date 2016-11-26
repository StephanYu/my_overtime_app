class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create 
    @post = Post.new(post_params)
    @post.user = current_user

    if @post.save
      redirect_to @post, notice: 'Post succesfully created'
    else
      render :new
    end
  end

  def show
  end

  def edit
    authorize @post
  end

  def update
    authorize @post
    
    if @post.update(post_params)
      redirect_to @post, notice: "Post successfully updated"
    else
      render :edit
    end
  end

  def destroy
    @post.delete
    redirect_to posts_path, notice: "Post successfully deleted"
  end

  private

  def post_params
    params.require(:post).permit(:date, :rationale, :status)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
