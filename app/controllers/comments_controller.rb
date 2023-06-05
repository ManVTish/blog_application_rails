class CommentsController < ApplicationController
  before_action :find_post, only: [:create, :destroy, :index]
  before_action :find_comment, only: :destroy
  # def create
  #   @comment = Comment.new(comment_params)
  #   if @comment.save
  #     redirect_to @comment.post, notice: "Comment was successfully created."
  #   else
  #     render :new, status: :unprocessable_entity
  #   end
  # end

  def create
    @comment = @post.comments.new(comment_params)

    if @comment.save
      redirect_to post_comments_path(@post), notice: "Comment was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @post_comments = @post.comments
  end

  def new
    @comment = Comment.new
  end

  def destroy
    @comment.destroy
    redirect_to post_path(@post), notice: "Comment was successfully destroyed."
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end

  def find_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:commented)
  end
end
