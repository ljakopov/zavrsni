class ActivitiesController < ApplicationController
  before_action :confirm_logged_in

  def index
    @activities =Activity.where(user_id:session[:user_id]).order("created_at desc")
  end


end
