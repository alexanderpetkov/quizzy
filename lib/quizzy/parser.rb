module Quizzy
  class Parser
    def self.parse_file(path_to_file)
      file = File.open(path_to_file, 'rb')
      full_text = file.read
      file.close

      lines = full_text.split("\n").select { |line| line.size > 0 }
      indices = lines.each_index.select { |i| lines[i][0] == '@' }
      indices << lines.length

      indices.each_cons(2) { |x, y| parse_question(lines[x...y]) }
    end

    def self.parse_question(question_md)
      category_section = question_md.select { |x| x[0] == '@' }.first
      category_section.slice!(0)
      category_names = category_section.split(',')

      categories = []

      category_names.each do |category_name|
        categories << Category.find_or_create_by(name: category_name.strip)
      end

      question_text = question_md.select { |x| x[0] == '?' }.first
      question_text.slice!(0)
      question = Question.create(text: question_text.strip)

      answers_texts = question_md.select { |x| x[0] == '+' || x[0] == '-' }
      answers_texts.each do |answer_text|
        is_correct = answer_text.slice!(0) == '+'
        question.answers << Answer.create(
          text: answer_text.strip,
          is_correct: is_correct
        )
      end

      categories.each { |category| question.categories << category }
    end
  end
end
