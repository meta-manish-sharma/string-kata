class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?
    numbers = numbers.gsub("\n", ",")
    numbers.split(",").map(&:to_i).sum
  end
end