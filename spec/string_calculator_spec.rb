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
end