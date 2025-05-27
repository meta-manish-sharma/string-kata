require_relative './safe_math_evaluator'
require_relative './string_parser'
class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?
    delimiter, numbers = StringParser.parse(numbers)
    nums = numbers.split(delimiter).map do |num|
      SafeMathEvaluator.evaluate(num)
    end

    negatives = nums.select { |n| n < 0 }
    raise "negative numbers not allowed: #{negatives.join(',')}" if negatives.any?
    nums.reject { |n| n > 1000 }.sum
  end
end