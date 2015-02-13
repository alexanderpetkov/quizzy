class QuestionsUsers < ActiveRecord::Base
  def self.filter_by_category(category_name)
    QuestionsUsers.select do |entry|
      question = Question.find(entry.question_id)
      question.categories.map(&:name).include? category_name
    end
  end
end