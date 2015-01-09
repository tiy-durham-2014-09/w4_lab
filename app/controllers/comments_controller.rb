class CommentsController < ApplicationController
  before_action :authenticate
  def index
    @comments = Comment.all
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.commenter = current_user
    redirect_to post_path(@post)
  end

  def edit
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @post = @comment.post(params[:post_id])
    @comment.destroy
    redirect_to posts_path
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body, :user, :user_id, :post, :post_id)
  end
end
