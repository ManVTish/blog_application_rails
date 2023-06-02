class PostsController < ApplicationController
  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = "Post created"
      redirect_to @post, notice: "Post was successfully created."
    else
      render :new
    end
  end

  def new
    @post = Post.new
  end

  private

  def post_params
    params.require(:posts).permit(:title, :body)
  end
end
