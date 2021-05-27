class Admin::WordsController < ApplicationController
  before_action :require_admin

  def index
    @category = Category.find(params[:category_id])
    @words = @category.words
  end

  def new
    @category = Category.find(params[:category_id])
    @word = Word.new
    3.times { @word.choices.new }
  end

  def create
    @category = Category.find(params[:category_id])
    @word = @category.words.new(word_params)
    if @word.save
      redirect_to admin_category_words_url
    else
      render "new"
    end
  end

  def edit
    @category = Category.find(params[:category_id])
    @word = Word.find(params[:id])
  end

  def update
    @category = Category.find(params[:category_id])
    @word = Word.find(params[:id])
    if @word.update(word_params)
      redirect_to admin_category_words_url
    else
      render "edit"
    end
  end

  def destroy
    @category = Category.find(params[:category_id])
    @word = Word.find(params[:id])
    @word.destroy

    redirect_to admin_category_words_url
  end

  private
  def word_params
    params.require(:word).permit(:content, choices_attributes: [:id, :content, :is_correct])
  end
end
