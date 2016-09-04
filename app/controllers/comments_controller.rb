class CommentsController < ApplicationController
  def create
    @post=Post.find(params[:post_id])
    @comment=@post.comments.create! comment_params
    @comment.user_id=session[:user_id]
    if @comment.save
      track_activity @comment
      respond_to do |format|
        format.html{redirect_back(fallback_location: root_url(@post))}
        format.js
      end
    end
  end
  private
  def comment_params
    params.require(:comment).permit(:body, :post_od, :user_id)
  end
end
