class PostsController < ApplicationController
  def create
    @post = Post.new(post_params)
    if @post.save
      render json: {msg: "Post creation successful"}
    else
      render json: {msg: "Post creation failed"}
    end
  end

  private

  def post_params
    params.require(:posts).permit(:title, :body)
  end
end
