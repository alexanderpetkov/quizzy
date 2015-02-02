class Question < ActiveRecord::Base
  validates_presence_of :text

  has_many :answers

  has_and_belongs_to_many :categories
end