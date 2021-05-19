class CategoriesController < ApplicationController
  def index
    @categories = Category.all.paginate(page: params[:page], per_page: 6)
  end
end
