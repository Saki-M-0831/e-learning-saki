class Admin::PagesController < ApplicationController
  before_action :require_admin

  private
  def require_admin
    unless current_user.is_admin == true
      flash[:error] = "You do not have the access to this section"

      redirect_to root_url 
    end
  end

  def home
  end
end
