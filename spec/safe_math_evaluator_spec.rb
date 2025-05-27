require './safe_math_evaluator'

RSpec.describe SafeMathEvaluator do
  describe ".evaluate" do
    it "evaluates simple addition" do
      expect(described_class.evaluate("2+3")).to eq(5)
    end

    it "evaluates mixed operations" do
      # integer division: 5 / 2 == 2
      expect(described_class.evaluate("2 + 3 * 4 - 5 / 2")).to eq(2 + 3 * 4 - 5 / 2)
    end

    it "evaluates expressions with spaces" do
      expect(described_class.evaluate("  10  * 5 ")).to eq(50)
    end

    it "raises error for invalid characters" do
      expect { described_class.evaluate("2 + 3; system('rm -rf /')") }.to raise_error(/Invalid characters/)
      expect { described_class.evaluate("abc + 1") }.to raise_error(/Invalid characters/)
      expect { described_class.evaluate("2 + (3)") }.to raise_error(/Invalid characters/) # parentheses not allowed
    end

    it "raises error on division by zero" do
      expect { described_class.evaluate("10 / 0") }.to raise_error(/Division by zero/)
    end

    it "raises error on invalid expressions" do
      expect { described_class.evaluate("") }.to raise_error(/Invalid characters/)
    end

    it "evaluates large numbers" do
      expect(described_class.evaluate("1000 * 1000")).to eq(1_000_000)
    end
  end
end