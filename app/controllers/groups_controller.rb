class GroupsController < ApplicationController
  before_action :confirm_logged_in

  def index
    @groups=Group.where(user_id:current_user)
  end

  def show
    @group=Group.find(params[:id])
    @posts=Post.where(user_id:@group.group_users.select(:user_id)).order(created_at: :desc).page params[:page]
  end

  def new
    @user=session[:user_id]
    @group=Group.new
  end

  def create
    @group=current_user.groups.create(groups_params)
    if @group.save
      track_activity @group
      redirect_to user_groups_path
    else
      render('new')
    end
  end

  def destroy
    @group=Group.find(params[:id]).destroy
    redirect_to user_groups_path(session[:user_id])
  end

  private
  def groups_params
    params.require(:group).permit(:title, :description)
  end
end
