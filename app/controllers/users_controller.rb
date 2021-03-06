class UsersController < ApplicationController
  before_action :confirm_logged_in, :except =>[:new, :create, :confirm_email]
  before_action :find_user, :only => [:show]

  def index
    @users=User.all
  end

  def show
    @user=@user_re
    @friends=@user_re.friends
    @posts=@user_re.posts.order(created_at: :desc)
    @followers=Friendship.where(friend_id:@user).size
    if @user!=current_user
      @variable=current_user.friendships.exists?(user_id:session[:user_id], friend_id:@user)
    else
      @variable=true
    end
  end

  def new
    @user=User.new
  end

  def create
    @user=User.new(user_params)
    if @user.save
      UserMailer.account_activation(@user).deliver_now
      flash[:notice]="Activate your account via email"
      redirect_to users_path
    else
      render ('new')
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
      render ('edit')
    end
  end

  def destroy
    @user=User.find(params[:id]).destroy
    user_posts_path(current_user)
  end

  def admin
    @user=User.find(params[:id])
    if @user.admin==false
      @user.admin=true
    else
      @user.admin=false;
    end
    @user.save
    redirect_to users_path
  end

  def active
    @user=User.find(params[:id])
    if @user.activate==false
      @user.activate=true
    else
      @user.activate=false;
    end
    @user.save
    redirect_to users_path
  end

  def confirm_email
    user=User.find_by_activation_digest(params[:activation_digest])
    if user.activate==false
      user.activate=true
      user.save
    else
      flash[:notice]="User is activate"
    end
    redirect_to root_path
  end

  def image
    @user=User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to root_path
    else
      render ('edit')
    end
  end

  def trazi
    @users = User.search(params[:search]).order(created_at: :desc)
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :image, :username, :password, :password_confirmation, :email, :activation_digest)
  end
end
