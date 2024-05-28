class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    delimiter = ","
    if numbers.start_with?("//")
      parts = numbers.split("\n", 2)
      delimiter = parts[0][2..-1]
      numbers = parts[1]
    end

    numbers = numbers.gsub("\n", delimiter)
    num_list = numbers.split(delimiter).map(&:to_i)
    
    negatives = num_list.select { |num| num < 0 }
    if negatives.any?
      raise "negative numbers not allowed: #{negatives.join(', ')}"
    end

    num_list.sum
  end
end

# Example usage
# calculator = StringCalculator.new
# puts calculator.add("")            # Output: 0
# puts calculator.add("1")           # Output: 1
# puts calculator.add("1,5")         # Output: 6
# puts calculator.add("1\n2,3")      # Output: 6
# puts calculator.add("//;\n1;2")    # Output: 3

# begin
#   puts calculator.add("1,-2,3")    # Should raise exception
# rescue => e
#   puts e.message                   # Output: negative numbers not allowed: -2
# end
