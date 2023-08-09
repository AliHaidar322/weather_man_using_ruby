
module FileDateHandling

    def file_handling 
        date = ARGV[1]
        path =ARGV[2]
        if ARGV[0]  == "-a"
            array_of_files = Dir.glob("#{path}/*_#{date.to_s}_*")
            return array_of_files
        else
            array = CSV.read(path)
            return array
        end
    end


    def date_handling 
        date = ARGV[1]
        path =ARGV[2]

        month = date.match(/(?<=\/)\w+/)
        year= date.match(/\d+(?=\/\d+)/)

        year = year[0].to_i
        month = month[0].to_i
        month_name = Date::MONTHNAMES[month]

        days = Date.new(year,month,-1)
        days = days.day  
        return days
    end
end