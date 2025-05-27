require './string_parser'

RSpec.describe StringParser do
  describe '.parse' do
    context 'with no custom delimiter' do
      it 'returns default delimiter and original string' do
        delimiter, numbers = StringParser.parse("1,2\n3")
        expect(delimiter).to eq(/,|\n/)
        expect(numbers).to eq("1,2\n3")
      end
    end

    context 'with single-character custom delimiter' do
      it 'extracts the delimiter from header' do
        delimiter, numbers = StringParser.parse("//;\n1;2;3")
        expect(delimiter).to eq(/;/)
        expect(numbers).to eq("1;2;3")
      end
    end

    context 'with multi-character custom delimiter' do
      it 'extracts the correct delimiter' do
        delimiter, numbers = StringParser.parse("//[***]\n1***2***3")
        expect("1***2***3".split(delimiter)).to eq(["1", "2", "3"])
      end
    end

    context 'with multiple custom delimiters' do
      it 'combines all delimiters into a union' do
        delimiter, numbers = StringParser.parse("//[*][%]\n1*2%3")
        expect(numbers).to eq("1*2%3")
      end
    end

    context 'with multiple multi-char delimiters' do
      it 'handles all of them properly' do
        delimiter, numbers = StringParser.parse("//[***][%%]\n1***2%%3")
        expect(numbers).to eq("1***2%%3")
      end
    end
  end
end
