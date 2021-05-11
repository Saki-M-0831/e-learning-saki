class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      login(@user)
      flash[:success] = "Yay, You're Logged In Now!!"

      redirect_to @user
    else
      flash.now[:danger] = "Ooops, Invalid Credentials..."

      render "new"
    end
  end

  def destroy
    @user = User.find(params[:id])
  end
end
