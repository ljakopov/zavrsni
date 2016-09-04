class GroupUsersController < ApplicationController
  before_action :confirm_logged_in
  def index
  end

  def new
    @group=Group.find(params[:group_id])
    @without_group_users=@group.group_users
    @friendships=current_user.friendships.where.not(friend_id:@without_group_users.select(:user_id))
  end

  def create
    group=Group.find(params[:group_id])
    user=User.find(params[:user_id])
    @groups=group.group_users.build(:user_id => params[:user_id])
    if @groups.save
      track_activity @groups
      flash[:notice]="User #{user.username} added to group  #{group.title}"
      redirect_to new_user_group_group_user_path(@groups)
    end
  end

  def destroy
    GroupUser.where(group_id:params[:group_id], user_id:params[:user_id]).destroy_all
    group=Group.find(params[:group_id])
    user=User.find(params[:user_id])
    flash[:notice]="User " + user.username + " removed from group " + group.title
    redirect_to new_user_group_group_user_path(group)
  end


end
