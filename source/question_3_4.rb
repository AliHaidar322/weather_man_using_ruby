require "colorize"
require_relative "Getter" # to use Getter module
require_relative "utility_methods" # to use loop runing function to check files runing for lahore or for other city
require "date" # for using date class to get date from numbers
require_relative "helper_for_last_method"
def question_3_4
    include Getter
    # Getting values from user
    moonth_and_year = ARGV[1]
    file_path = ARGV[2]
    # dealing with file and extracting data
    array = CSV.read(file_path)
    flag = false
    flag = loop_running(file_path,array,flag)
    count_for_day = 1
    array[1..-1].each_with_index do |i, index|
        if flag
            next if index < 2
            next if index == array.length - 1
        end
        helper_method(i,count_for_day)
    end
end