class User < ActiveRecord::Base
  validates_presence_of :name, :email
  validates_uniqueness_of :email

  has_and_belongs_to_many :questions

  has_secure_password

  def statistics
    QuestionsUsers.where(user_id: id)
  end

  def statistics_by_category(category_name)
    related = self.questions.select do |question|
      question.categories.include? Category.find_by(name: category_name)
    end

    QuestionsUsers.select do |entry|
      entry.user_id == self.id && related.map(&:id).include?(entry.question_id)
    end
  end
end
