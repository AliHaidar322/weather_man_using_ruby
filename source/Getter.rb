require "csv"

module Getter
    @max_temp_index = 0
    @min_temp_index = 0
    @max_humd_index = 0
    @date_index = 0

    def get_indexes(array)
        count = 0
        array.each do |j|
            if j == "Max TemperatureC" 
                @max_temp_index = count
            elsif j == "Min TemperatureC"
                @min_temp_index = count
            elsif j == "Max Humidity"
                @max_humd_index = count
            elsif (j == "GST" || j == "PKT")
                @date_index = count
            end
            count += 1
        end
    end

    def get_values (i, max_var,index)
        if  !(i[index].nil?)
            if i[index].to_i > max_var[1]
                max_var[0] = i[@date_index].to_s
                max_var[1] = i[index].to_i
            end
        end
    end
end