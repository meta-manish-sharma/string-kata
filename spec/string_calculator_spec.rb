require './string_calculator'

RSpec.describe StringCalculator do
  let(:calc) { StringCalculator.new }

  it "returns 0 for an empty string" do
    expect(calc.add("")).to eq(0)
  end

  it "returns a number if only one is provided" do
    expect(calc.add("1")).to eq(1)
  end

  it "returns sum of two numbers" do
    expect(calc.add("1,5")).to eq(6)
  end

  it "returns sum of multiple numbers" do
    expect(calc.add("1,2,3,4")).to eq(10)
  end

  it "handles newline as delimiter" do
    expect(calc.add("1\n2,3")).to eq(6)
  end

  it "supports custom delimiter" do
    expect(calc.add("//;\n1;2")).to eq(3)
  end

  it "raises error for negative number" do
    expect { calc.add("1,-2,3") }.to raise_error("negative numbers not allowed: -2")
  end

  it "lists all negative numbers in exception" do
    expect { calc.add("1,-2,-5") }.to raise_error("negative numbers not allowed: -2,-5")
  end
end