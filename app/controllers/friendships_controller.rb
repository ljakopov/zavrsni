class FriendshipsController < ApplicationController
  before_action :confirm_logged_in

  def new
    current_user_friendships=current_user.friendships
    id=current_user_friendships.select(:friend_id)
    users=User.where.not(id: current_user)
    @user=users.where.not(id:id)
    @friendship=Friendship.new
  end

  def create
    @friendship=current_user.friendships.build(:friend_id => params[:friend_id])
    if @friendship.save
      flash[:notice]="Added friend"
      track_activity @friendship
      redirect_to request.referrer
    else
      flash[:error] = "Unable to add friend"
    end
  end

  def destroy
    friend=User.find(params[:user_id])
    Friendship.where(user_id:current_user, friend_id:friend).destroy_all
    redirect_to user_path(friend)
  end

end
