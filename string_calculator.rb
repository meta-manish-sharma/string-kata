require './safe_math_evaluator'
require './string_parser'
require './negative_number_validator'
class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?
    delimiter, numbers = StringParser.parse(numbers)
    nums = numbers.split(delimiter).map do |num|
      SafeMathEvaluator.evaluate(num)
    end

    NegativeNumberValidator.check(nums)

    nums.reject { |n| n > 1000 }.sum
  end
end