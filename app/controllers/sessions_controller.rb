class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])

      login(@user)
      flash[:success] = "Yay, You're Logged In Now!!"

      redirect_to root_url 
    else
      flash.now[:danger] = "Ooops, Invalid Credentials..."

      render "new"
    end
  end

  def destroy
    @user = User.find(params[:id])
    logout

    flash[:info] = "Logged Out!! See You Again!!"
    redirect_to new_session_url
  end

end
