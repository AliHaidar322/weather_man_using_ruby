require_relative "Getter"
require_relative "utility_methods"
require_relative "FileDateHandling"

def question_2
    include FileDateHandling

    getter_for_b = Getter.new

    total_max_temp = 0
    total_humd = 0
    total_min_temp = 0
     
    array = file_handling
    flag = false
    flag = loop_running(array,flag,getter_for_b)

    array[1..-1].each.each_with_index do |sub_array, index|
        if flag
            next if index < 2
            next if index == array.length - 1               
        end
        total_max_temp = total_max_temp + sub_array[getter_for_b.max_temp_index].to_i
        total_min_temp = total_min_temp + sub_array[getter_for_b.min_temp_index].to_i
        total_humd = total_humd + sub_array[getter_for_b.max_humd_index].to_i
    end
    days = date_handling
    puts "Highest Average Temperature: #{average_highest_temp = (total_max_temp.to_f / days.to_f).round}C"
    puts "Lowest Average Temperature: #{average_lowest_temp = (total_min_temp.to_f / days.to_f).round}C"
    puts "Humidity: #{average_humd = (total_humd.to_f / days.to_f).round}%"
end
