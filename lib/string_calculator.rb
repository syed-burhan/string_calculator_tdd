class StringCalculator
    def self.add(numbers)
        return 0 if numbers.empty?

        if numbers.start_with?("//")
            delimiter, numbers = numbers.split("\n", 2)
            binding.pry
            delimiter = delimiter[2..-1]
        else
            delimiter = /,|\n/
        end

        numbers.split(delimiter).map(&:to_i).sum
    end
end
