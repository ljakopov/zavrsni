class CommentsController < ApplicationController

  def create
    @post=Post.find(params[:post_id])
    @comment=@post.comments.create(comment_params)
    @comment.user_id=session[:user_id]
    if @comment.save
      redirect_to @post
    end
  end
  private
  def comment_params
    params.require(:comment).permit(:body, :user_id, :post_od)
  end

end
