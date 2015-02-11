class AddIsCorrectToQuestionsUsers < ActiveRecord::Migration
  def change
    add_column :questions_users, :is_correct, :boolean
  end
end
