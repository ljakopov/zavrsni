class UsergroupsController < ApplicationController
  def index
  end

  def new
    @friendships=current_user.friendships
    @group=Group.find(params[:group_id])
  end

  def create

  end
end
