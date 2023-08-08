require_relative "Getter"
require_relative "utility_methods"
def question_2
    include Getter
    # variables and data structures
    total_max_temp = 0
    total_humd = 0
    total_min_temp = 0
    # Getting Command line arguments
    moonth_and_year = ARGV[1]
    file_path = ARGV[2]
    # Extracting year and month
    month = moonth_and_year.match(/(?<=\/)\w+/)
    year= moonth_and_year.match(/\d+(?=\/\d+)/)
    year = year[0].to_i
    month = month[0].to_i
    month_name = Date::MONTHNAMES[month]
    # Reading data from file
    array = CSV.read(file_path)
    # Getting indexes  
    flag = false
    flag = loop_running(file_path,array,flag)
    # Calculating and displaying average
    array[1..-1].each.each_with_index do |k, index|
        if flag
            next if index < 2
            next if index == array.length - 1               
        end
        total_max_temp = total_max_temp + k[@max_temp_index].to_i
        total_min_temp = total_min_temp + k[@min_temp_index].to_i
        total_humd = total_humd + k[@max_humd_index].to_i
    end
    days = Date.new(year,month,-1)
    days = days.day    
    puts "Highest Average Temperature: #{average_highest_temp = (total_max_temp.to_f / days.to_f).round}C"
    puts "Lowest Average Temperature: #{average_lowest_temp = (total_min_temp.to_f / days.to_f).round}C"
    puts "Humidity: #{average_humd = (total_humd.to_f / days.to_f).round}%"
end
