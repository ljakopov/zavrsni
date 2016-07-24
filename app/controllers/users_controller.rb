class UsersController < ApplicationController

  layout false

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

  def update
  end

  def delete
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :image, :username, :password)
  end

end
