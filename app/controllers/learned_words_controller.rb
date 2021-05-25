class LearnedWordsController < ApplicationController
  def index
    @categories = Category.all
    @words = current_user.word_learned(params[:word_filter])
  end
end
