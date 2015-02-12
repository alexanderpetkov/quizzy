class Question < ActiveRecord::Base
  validates_presence_of :text

  has_many :answers

  has_and_belongs_to_many :categories
  has_and_belongs_to_many :users

  def correctly_answered?(given_answers_ids)
    answers.where(is_correct: true).map(&:id).sort == given_answers_ids.sort
  end
end
