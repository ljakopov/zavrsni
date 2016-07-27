class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private
  def confirm_logged_in
    unless session[:user_id]
      flash[:notice]="Please log in."
      redirect_to(:controller => 'access', :action => 'index')
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


  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end



end
