module LearnedWordsHelper
  def answer_color(answer)
    if answer.choice.content == answer.word.choices.find_by(is_correct: true).content
      "text-success"
    else
      "text-danger"
    end
  end
end
