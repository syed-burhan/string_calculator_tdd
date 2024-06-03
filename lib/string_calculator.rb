class StringCalculator
    def self.add(numbers)
        return 0 if numbers.nil? || numbers.to_s.empty?
        return numbers.to_i if numbers.is_a?(Integer)

        if numbers.start_with?("//")
            delimiter, numbers = numbers.split("\n", 2)
            delimiter = delimiter[2..-1]
        else
            delimiter = /,|\n/
        end

        numbers_list = numbers.split(delimiter).map(&:to_i)

        negetives = numbers_list.select { |n| n < 0 }
        raise "Negetive numbers not allowed: #{negetives.join(', ')}" if negetives.any?

        numbers_list.sum
    end
end
