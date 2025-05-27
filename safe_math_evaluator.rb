class SafeMathEvaluator
  ALLOWED_CHARS = /\A[0-9+\-*\/\s]+\z/

  def self.evaluate(expression)
    raise "Invalid characters in input: #{expression}" unless expression.match?(ALLOWED_CHARS)

    begin
      result = eval(expression)
      raise "Invalid expression: #{expression}" unless result.is_a?(Numeric)
      result
    rescue ZeroDivisionError
      raise "Division by zero: #{expression}"
    rescue StandardError
      raise "Could not evaluate expression: #{expression}"
    end
  end
end