class PostsController < ApplicationController

  layout false
  before_action :confirm_logged_in

  def index
    friendships=current_user.friendships
    id=friendships.select(:friend_id)
    @posts=Post.where(user_id:id).or(Post.where(user_id:session[:user_id])).order(created_at: :desc)
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
      redirect_to user_posts_path
    else
      render('new')
    end
  end


  def update
  end

  def destroy
  end

  private

  def posts_params
    params.require(:post).permit(:title, :image)
  end

end
