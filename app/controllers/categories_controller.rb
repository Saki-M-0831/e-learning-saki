class CategoriesController < ApplicationController
  def index
    @filter = params[:filter]
    @lessons = Lesson.where(user_id: current_user.id)

    if @filter == "learned"
      categ_ids = @lessons.pluck(:category_id)
      @categories = Category.where(id: categ_ids).paginate(page: params[:page], per_page: 6)
    elsif @filter == "not learned"
      categ_ids = Category.all.pluck(:id) - @lessons.pluck(:category_id)
      @categories = Category.where(id: categ_ids).paginate(page: params[:page], per_page: 6)
    else
      @categories = Category.paginate(page: params[:page], per_page: 6)
    end
  end
end
