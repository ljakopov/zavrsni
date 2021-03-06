class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  private
  def confirm_logged_in
    unless session[:user_id]
      redirect_to(:controller => 'access', :action => 'login')
      return false
    else
      return true
    end
  end

  def find_user
    if params[:user_id]
      @user_re=User.find(params[:user_id])

     else
      @user_re=User.find(params[:id])
      params[:user_id]=params[:id]
    end
  end

  def track_activity(trackable, action=params[:action])
    current_user.activities.create! action: action, trackable: trackable
  end

end
