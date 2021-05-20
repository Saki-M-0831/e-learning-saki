class Word < ApplicationRecord
  belongs_to :category
  has_many :choices, dependent: :destroy
  has_many :answers, dependent: :destroy
  accepts_nested_attributes_for :choices

  validates :content, presence: true

  validate :at_least_one_is_checked

  def correct_choice
    choices.find_by(is_correct: true).content
  end

  private
  def at_least_one_is_checked
    unless choices.select {|choice| choice.is_correct == true}.count == 1
      errors.add :base, "Must have one correct choice"
    end
  end
end
