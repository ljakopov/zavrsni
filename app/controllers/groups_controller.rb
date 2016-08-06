class GroupsController < ApplicationController

  def index
    @groups=Group.where(user_id:current_user)
  end

  def show
    @group=Group.find(params[:id])
  end

  def new
    @user=current_user
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

  private
  def groups_params
    params.require(:group).permit(:title, :description)
  end

end
