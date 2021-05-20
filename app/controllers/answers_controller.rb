class AnswersController < ApplicationController
  def new
    @lesson = Lesson.find(params[:lesson_id])
    if @lesson.next_word.nil?
      redirect_to lesson_path(@lesson)
    else
      @word = @lesson.next_word
      @lesson = Lesson.find(params[:lesson_id])
      @answer = Answer.new
    end
  end

  def create
    @lesson = Lesson.find(params[:lesson_id])
    @answer = @lesson.answers.new(answer_params)
    @answer.save
    
    redirect_to new_lesson_answer_url(@lesson)
  end

  private
  def answer_params
    params.require(:answer).permit(:word_id, :choice_id)
  end
end
