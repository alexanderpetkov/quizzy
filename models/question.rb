class Question < ActiveRecord::Base
  validates_presence_of :text

  has_many :answers,
           class_name: 'Answer',
           foreign_key: 'question_id'
end