class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to new_session_url
      
    else
      render "new"
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
     redirect_to root_url
    else
      render "edit"
    end
  end

  def index
    @users = User.all.paginate(page: params[:page], per_page: 6)
  end

  def show
    @user = User.find(params[:id])

  end

  def user_params
    params.require(:user).permit(:picture, :name, :email, :password, :password_confirmation, :is_admin)
  end
end
