require "csv"

require_relative "question_1"
require_relative "question_2"
require_relative "question_3_4"

def selection
    if ARGV[0] == "-a"
        question_1
    elsif ARGV[0] == "-b"
        question_2
    elsif ARGV[0] == "-c" || ARGV[0] == "-d"
        question_3_4
    end
end

selection