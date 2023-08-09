require_relative "Getter"
require_relative "utility_methods"
require_relative "FileDateHandling"

def question_1
    include FileDateHandling

    getter_for_a= Getter.new

    max_temp = ["",-99]
    min_temp = ["",99]
    max_humd = ["",0]

    array_of_files = file_handling 
    array_of_files.each  do |sub_array|
        array = CSV.read(sub_array)
        flag = false
        flag = loop_running(array,flag,getter_for_a)

        array[1..-1].each_with_index do |inner_sub_array , index|     
            if flag
                next if index < 2
                next if index == array.length - 1               
            end
            getter_for_a.get_values(inner_sub_array,max_temp,getter_for_a.max_temp_index)
            if  !(inner_sub_array[getter_for_a.min_temp_index].nil?)
                if inner_sub_array[getter_for_a.min_temp_index].to_i < min_temp[1]
                    min_temp[0] = inner_sub_array[getter_for_a.date_index].to_s
                    min_temp[1] = inner_sub_array[getter_for_a.min_temp_index].to_i
                end
            end
            getter_for_a.get_values(inner_sub_array,max_humd,getter_for_a.max_humd_index)
        end
    end
    puts "Highest: #{max_temp[1]} on #{max_temp[0]}"
    puts "Lowest: #{min_temp[1]} on #{min_temp[0]}"
    puts "Humid: #{max_humd[1]} on #{max_humd[0]}"
end