require_relative "utility_methods"

def helper_method (i,count_for_day)

       if ARGV[0] == "-c"
            max_temp_count = i[@max_temp_index].to_i
            check_for_temp_?(max_temp_count,count_for_day)
            max_temp_count.times do
                print "+".colorize(:red)
            end
            if max_temp_count != 0
                puts "#{i[@max_temp_index]}C"
            end
            min_temp_count = print_low_temp(i,count_for_day)
            if max_temp_count !=0 
                puts "#{i[@min_temp_index]}C"
                count_for_day += 1
            end
        elsif ARGV[0] == "-d"
            min_temp_count = print_low_temp(i,count_for_day)
            max_temp_count = i[@max_temp_index].to_i
            max_temp_count.times do
                print "+".colorize(:red)
            end
            if min_temp_count != 0
                print "#{i[@min_temp_index]}C-"
            end
            if (max_temp_count !=0 && min_temp_count != 0)
                puts "#{i[@max_temp_index]}C"
                count_for_day += 1
            end
        end
        
end

