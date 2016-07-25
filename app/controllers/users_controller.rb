class UsersController < ApplicationController

  layout false
  before_action :confirm_logged_in

  def index
    @users=User.all
  end

  def show
  end

  def new
    @user=User.new
  end

  def create
    @user=User.new(user_params)
    if @user.save
      redirect_to users_path
    else
      render new
    end
  end

  def edit
    @user=User.find(params[:id])
  end

  def update
    @user=User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to root_path
    else
      render edit
    end
  end

  def delete
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :image, :username, :password)
  end

end
