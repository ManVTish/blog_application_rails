class PostsController < ApplicationController
  def create
    @post = Post.new(post_params)
    authorize @post
    if @post.save
      flash[:alert] = "Post created"
      redirect_to @post, notice: "Post was successfully created."
    else
      render :new
    end
  end

  def new
    @post = Post.new
  end

  def index
    @posts = Post.all
    authorize @posts
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      redirect_to post_path, notice: "Post deleted"
    else
      redirect_to notice: "post not found"
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
