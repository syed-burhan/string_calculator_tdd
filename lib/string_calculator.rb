require 'pry'
class StringCalculator
    def self.add(numbers)
        return 0 if numbers.nil? || numbers.to_s.empty?
        return numbers.to_i if numbers.is_a?(Integer)

        delimiter = find_delimiter(numbers)

        numbers_list = numbers.split(delimiter).map(&:to_i)

        negetives = numbers_list.select { |n| n < 0 }
        raise "Negetive numbers not allowed: #{negetives.join(', ')}" if negetives.any?

        numbers_list.sum
    end

    private

    def self.find_delimiter(numbers)
        if numbers.start_with?("//") && numbers.size > 3
            delimiter = numbers[2]
            delimiter = Regexp.escape(delimiter)
        else
            delimiter = /,|\n|\s|;/
        end
    end
end
