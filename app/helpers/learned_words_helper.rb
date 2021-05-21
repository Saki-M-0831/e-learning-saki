module LearnedWordsHelper
  def answer_color(answer)
    if answer.choice.content == answer.word.correct_choice
      "text-success"
    else
      "text-danger"
    end
  end
end
