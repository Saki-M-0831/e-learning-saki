class LessonsController < ApplicationController
  def create
    if Lesson.find_by(user_id: current_user.id, category_id: params[:category_id])
      Lesson.find_by(user_id: current_user.id, category_id: params[:category_id]).destroy
    end  

    @lesson = current_user.lessons.new(category_id: params[:category_id])
    @lesson.save
    @lesson.create_activity(user_id: current_user.id)
    
    redirect_to new_lesson_answer_url(@lesson)
  end

  def show
    @lesson = Lesson.find(params[:id])
    @answers = @lesson.answers
    @category = @lesson.category
  end

  def continue
    @lesson = Lesson.find(params[:id])

    redirect_to new_lesson_answer_url(@lesson)
  end
end
