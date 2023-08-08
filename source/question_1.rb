require_relative "Getter"
require_relative "utility_methods"
def question_1
   include Getter
    # Necessary Variables
    max_temp = ["",-99]
    min_temp = ["",99]
    max_humd = ["",0]
    # Taking command line arguments
    year = ARGV[1]
    path_to_files_folder = ARGV[2]
    # Collecting relevant files in a array named array_of_files
    array_of_files = Dir.glob("#{path_to_files_folder}/*_#{year.to_s}_*")
    # Iterating on each file converting it in the form of a 2D array
    array_of_files.each  do |i|
        array = CSV.read(i)
        flag = false
        flag = loop_running(path_to_files_folder,array,flag)
        array[1..-1].each_with_index do |i , index|     
            if flag
                next if index < 2
                next if index == array.length - 1               
            end
            get_values(i,max_temp,@max_temp_index)
            if  !(i[@min_temp_index].nil?)
                if i[@min_temp_index].to_i < min_temp[1]
                    min_temp[0] = i[@date_index].to_s
                    min_temp[1] = i[@min_temp_index].to_i
                end
            end
            get_values(i,max_humd,@max_humd_index)

        end
    end
    puts "Highest: #{max_temp[1]} on #{max_temp[0]}"
    puts "Lowest: #{min_temp[1]} on #{min_temp[0]}"
    puts "Humid: #{max_humd[1]} on #{max_humd[0]}"
end