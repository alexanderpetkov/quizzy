class QuestionsUsers < ActiveRecord::Base
  def check(user_id, question_id)
    QuestionsUsers.find_by(
      user_id: user_id,
      question_id: question_id
    ).is_correct
  end
end