require "csv"

require_relative "maximums_from_year"
require_relative "search_average"
require_relative "displaying_plus_symbol"
require_relative "displaying_plus_symbol_2nd"

def selection
    if ARGV[0] == "-a"
        maximums_from_year
    elsif ARGV[0] == "-b"
        search_average
    elsif ARGV[0] == "-c"
        displaying_plus_symbol
    elsif ARGV[0] == "-d"
        displaying_plus_symbol_2
    end
end

selection