class Answer < ActiveRecord::Base
  validates_presence_of :text

  has_one :question, dependent: :destroy
end