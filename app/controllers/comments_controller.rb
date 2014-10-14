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
    @post = @comment.post.find(params[:post_id])
    @comment.destroy
    redirect_to post_path(@post)
  end

  private
  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:commenter, :body, :user, :user_id, :post, :post_id)
  end
end
