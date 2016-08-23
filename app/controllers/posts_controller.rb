class PostsController < ApplicationController

  before_action :confirm_logged_in

  def index
    friendships=current_user.friendships
    id=friendships.select(:friend_id)
    @posts=Post.where(user_id:id).or(Post.where(user_id:session[:user_id])).order(created_at: :desc).page params[:page]
    @comment=Comment.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @post=Post.find(params[:id])
  end

  def new
    @user=current_user
  end

  def create
    @post=current_user.posts.create(posts_params)
    if @post.save
      track_activity @post
      redirect_to user_path(current_user)
    else
      render ('new')
    end
  end


  def update
  end

  def destroy
  end

  def upvote
    @post=Post.find(params[:id])
    @post.upvote_from current_user
    track_activity @post
    redirect_to request.referrer
     end

  private

  def posts_params
    params.require(:post).permit(:title, :image)
  end

end
