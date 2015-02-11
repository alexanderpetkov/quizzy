class AddUserAnswers < ActiveRecord::Migration
  def change
    create_table :questions_users, id: false do |t|
      t.belongs_to :question, index: true
      t.belongs_to :user, index: true
    end
  end
end
