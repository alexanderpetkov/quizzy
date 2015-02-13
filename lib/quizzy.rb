require 'yaml'

module Quizzy
  markdown_config = YAML.load_file("#{__dir__}/../config/markdown.yml")

  Quizzy::MARKDOWN_CHARS = markdown_config['chars']
end

class Array
  def quizzy_print(multiline: false)
    delimiter = multiline ? "\n" : ' '

    "#{self[0...-1].join(",#{delimiter}")} and#{delimiter}#{self[-1]}"
  end
end

require 'quizzy/parser.rb'
