class FriendshipsController < ApplicationController
  before_action :confirm_logged_in
  def create
  end

  def new
    current_user_friendships=current_user.friendships
    id=current_user_friendships.select(:friend_id)
    users=User.where.not(id: current_user)
    @user=users.where.not(id:id)
    @friendship=Friendship.new
  end

  def index
    @friendship=current_user.friendships.build(:friend_id => params[:friend_id])
    if @friendship.save
      flash[:notice]="Added friend"
      redirect_to new_friendship_path
    else
      flash[:error] = "Unable to add friend"
    end

  end

end
