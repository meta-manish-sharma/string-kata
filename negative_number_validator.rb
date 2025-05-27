class NegativeNumberValidator
  def self.check(numbers)
    negatives = numbers.select(&:negative?)
    raise "negative numbers not allowed: #{negatives.join(',')}" if negatives.any?
  end
end