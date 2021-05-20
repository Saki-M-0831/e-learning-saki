class LessonsController < ApplicationController
  def create
    @lesson = current_user.lessons.new(category_id: params[:category_id])
    @lesson.save
    
    redirect_to new_lesson_answer_url(@lesson)
  end

  def show
    @lesson = Lesson.find(params[:id])
    @answers = @lesson.answers
    @category = @lesson.category
  end
end
