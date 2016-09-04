class AccessController < ApplicationController


  def index
  end

  def login
  end

  def attempt_login
    if params[:username].present? && params[:password].present?
      found_user=User.where(:username => params[:username], :activate => true).first
      if found_user
        authorized_user=found_user.authenticate(params[:password])
      end
    end

    if authorized_user
      flash[:notice] = "Logirani ste!"
      session[:user_id]=authorized_user.id
      session[:username]=authorized_user.username
      session[:admin]=authorized_user.admin
      track_activity authorized_user
      redirect_to user_posts_path(session[:user_id])
    else
      flash[:danger]="Invalid email or password"
      redirect_to(:action => 'login')
    end

  end

  def logout
    track_activity current_user
    session[:user_id]=nil
    session[:username]=nil
    redirect_to(:action =>"login")
  end

end
