require "colorize"
require_relative "Getter" 
require_relative "utility_methods" 
require "date" 
require_relative "helper_for_last_method"
require_relative "FileDateHandling"


def question_3_4
    include FileDateHandling

    getter_for_cd = Getter.new

    array = file_handling
    flag = false
    flag = loop_running(array,flag,getter_for_cd)
    count_for_day = 1
    array[1..-1].each_with_index do |i, index|
        if flag
            next if index < 2
            next if index == array.length - 1
        end
        count_for_day = helper_method(i,count_for_day,getter_for_cd)
    end
end