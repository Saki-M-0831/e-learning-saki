class LearnedWordsController < ApplicationController
  def index
    categ_ids = Lesson.where(user_id: current_user.id).pluck(:category_id)
    @categories = Category.where(id: categ_ids)
    @words = current_user.word_learned(params[:word_filter]).paginate(page: params[:page], per_page: 6)
    
    @button_name = params[:word_filter] ? Category.find(params[:word_filter]).title : "Categories"
  end
end
