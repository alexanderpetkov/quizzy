require 'yaml'

module Quizzy
  markdown_config = YAML.load_file("#{__dir__}/../config/markdown.yml")

  Quizzy::MARKDOWN_CHARS = markdown_config['chars']
end

require 'quizzy/parser.rb'
