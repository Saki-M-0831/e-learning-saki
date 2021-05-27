class Admin::CategoriesController < ApplicationController
  before_action :require_admin

  private
  def require_admin
    unless current_user.is_admin == true
      flash[:error] = "You do not have the access to this section"

      redirect_to root_url 
    end
  end


  def index
    @categories = Category.all.paginate(page: params[:page], per_page: 10)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(categ_params)
    if @category.save
      redirect_to admin_categories_url
    else
      render "new"
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(categ_params)
      redirect_to admin_categories_url
    else
      render "edit"
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    redirect_to admin_categories_url
  end

  def categ_params
    params.require(:category).permit(:title, :description)
  end
end
