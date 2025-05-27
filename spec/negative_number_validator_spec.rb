require './negative_number_validator'

RSpec.describe NegativeNumberValidator do
  describe '.check' do
    context 'when no negative numbers are present' do
      it 'does not raise any error' do
        expect {
          NegativeNumberValidator.check([1, 2, 3])
        }.not_to raise_error
      end
    end

    context 'when one negative number is present' do
      it 'raises an error with the negative number listed' do
        expect {
          NegativeNumberValidator.check([1, -2, 3])
        }.to raise_error("negative numbers not allowed: -2")
      end
    end

    context 'when multiple negative numbers are present' do
      it 'raises an error listing all negative numbers' do
        expect {
          NegativeNumberValidator.check([-1, -5, 3])
        }.to raise_error("negative numbers not allowed: -1,-5")
      end
    end

    context 'when empty array is given' do
      it 'does not raise an error' do
        expect {
          NegativeNumberValidator.check([])
        }.not_to raise_error
      end
    end
  end
end
