class Admin::UsersController < ApplicationController
  def index
    @users = User.all.paginate(page: params[:page], per_page: 6)
  end

  def add_admin
    @user = User.find(params[:id])
    @user.update(is_admin: true)

    redirect_to admin_users_url
  end

  def remove_admin
    @user = User.find(params[:id])
    @user.update(is_admin: false)

    redirect_to admin_users_url
  end
end
