class AccessController < ApplicationController

  layout false

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
      redirect_to users_path
    else
      flash[:notice]='Kriva lozika ili password'
      redirect_to(:action => 'login')
    end

  end

end
