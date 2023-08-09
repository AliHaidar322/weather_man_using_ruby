require_relative "Getter"

def check_for_temp_? (temp, displaying_value)
    if temp != 0
        print displaying_value
    end
end

def loop_running (array,flag,getter)
    file_path = ARGV[2]
    if file_path =~ /lahore/
        array[1..-1].each_with_index do |i , index|
            next if  index == array.length-1
            getter.get_indexes(i)
        end
        flag = true
    else
        array.each do |i|
            getter.get_indexes(i) 
        end
    end
    return flag
end

def print_low_temp (i,count_for_day,min_temp_index)
    if !i[min_temp_index].nil?
        min_temp_count = i[min_temp_index].to_i
        check_for_temp_?(min_temp_count,count_for_day)
        min_temp_count.times do
            print "+".colorize(:blue)
        end
        return min_temp_count
    else
        return 0
    end
end