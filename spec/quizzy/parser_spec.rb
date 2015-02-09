require 'spec_helper'

describe Quizzy::Parser do
  subject(:parser) { Quizzy::Parser }

  let(:text) {
    %W(
      @#{category}
      ?#{question_text}
      +#{correct_answer}
      -#{incorrect_answer1}
      -#{incorrect_answer2}
      -#{incorrect_answer3}
    )
  }

  let(:file_name) { 'temp_file' } 
  let(:file) { File.new(file_name, 'w') }

  let(:created_category) { Category.find_by(name: category) }
  let(:created_question) { Question.find_by(text: question_text) }
  let(:created_answers) { Answer.where(question_id: created_question.id) }

  before do
    file.puts text
    file.close

    parser.parse_file(file)
  end

  after do
    File.delete(file)
  end

  describe "parsing typical question" do
    let(:category) { 'geography' }
    let(:question_text) { 'What is the capital of France?' }
    let(:correct_answer) { 'Paris' }
    let(:incorrect_answer1) { 'London' }
    let(:incorrect_answer2) { 'Sofia' }
    let(:incorrect_answer3) { 'Berlin' }

    it 'creates category, question and answers' do
      expect(created_category).to be
      expect(created_question).to be
      expect(created_answers.all?).to be true
    end

    it 'properly links question and category' do
      expect(created_category.questions).to eq([created_question])
      expect(created_question.categories).to eq([created_category])
    end

    it 'creates answers according to md' do
      expect(Answer.find_by(text: correct_answer).is_correct).to be true
      [incorrect_answer1, incorrect_answer2, incorrect_answer3].each do |ans|
        expect(Answer.find_by(text: ans).is_correct).to be false
      end
    end
  end
end
