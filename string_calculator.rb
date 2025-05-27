# require 'pry'
require_relative './safe_math_evaluator'
class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?
    delimiter = /,|\n/
    if numbers.start_with?("//")
      header, numbers = numbers.split("\n", 2)
      if header.include?("[")
        delimiters = header.scan(/\[(.*?)\]/).flatten
        delimiter = Regexp.union(delimiters)
      else
        delimiter = Regexp.escape(header[-1])
      end
    end
    nums = numbers.split(delimiter).map do |num|
      SafeMathEvaluator.evaluate(num)
    end
    negatives = nums.select { |n| n < 0 }
    raise "negative numbers not allowed: #{negatives.join(',')}" if negatives.any?

    nums.reject { |n| n > 1000 }.sum
  end
end