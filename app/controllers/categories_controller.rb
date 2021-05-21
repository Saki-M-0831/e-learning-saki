class CategoriesController < ApplicationController
  def index
    @categories = Category.all.paginate(page: params[:page], per_page: 6)
    @lessons = Lesson.where(user_id: current_user.id)
  end
end
