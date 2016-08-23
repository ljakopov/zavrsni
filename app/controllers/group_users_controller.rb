class GroupUsersController < ApplicationController
  before_action :confirm_logged_in
  def index
  end

  def new
    @group=Group.find(params[:group_id])
    @without_group_users=@group.group_users
    @friendships=current_user.friendships.where.not(friend_id:@without_group_users.select(:user_id))
    @users=User.where(id:@without_group_users)
  end

  def create
    @groups=GroupUser.new
    group=Group.find(params[:group_id])
    user=User.find(params[:user_id])
    group.group_users << @groups
    user.group_users << @groups
    if @groups.save
      track_activity @groups
      redirect_to new_user_group_group_user_path(@groups)
    end
  end

  def destroy
    group=Group.find(params[:group_id])
    GroupUser.find(params[:id]).destroy
    redirect_to new_user_group_group_user_path(group)
  end


end
