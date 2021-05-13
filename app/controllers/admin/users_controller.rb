class Admin::UsersController < ApplicationController
  def home
    @users = User.all.paginate(page: params[:page], per_page: 6)
  end

end
