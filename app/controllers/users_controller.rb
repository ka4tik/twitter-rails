class UsersController < ApplicationController
  before_filter :authenticate, :only => [:edit,:update]
  before_filter :correct_user, :only => [:edit,:update]
  before_filter :admin_user,   :only => [:destroy]

  def index
    @users=User.paginate(:page=>params[:page])
  end
  def new
    @user=User.new
  end

  def show
    @user=User.find(params[:id])
  end

  def create
    @user=User.new(user_params)
    if @user.save
      flash[:success]="Welcome to Sample App"
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def edit
    @user=User.find(params[:id])
  end

  def update
    @user=User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success]="Profile Updated"
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  def destroy
      User.find(params[:id]).destroy
      redirect_to users_path, :flash => {:sucess => "User destroyed."}
  end

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  private

  def authenticate
    deny_access unless signed_in?
  end

  def correct_user
    @user=User.find(params[:id])
    redirect_to(pages_home_path) unless current_user?(@user)
  end

  def admin_user
    redirect_to(pages_home_path) unless current_user.admin?
  end
end
