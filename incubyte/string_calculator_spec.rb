require 'rspec'
require_relative 'string_calculator'

RSpec.describe StringCalculator do
  let(:calculator) { StringCalculator.new }

  describe '#add' do
    it 'returns 0 for an empty string' do
      expect(calculator.add("")).to eq(0)
    end

    it 'returns the number itself if the input is a single number' do
      expect(calculator.add("1")).to eq(1)
      expect(calculator.add("5")).to eq(5)
    end

    it 'returns the sum of two numbers' do
      expect(calculator.add("1,5")).to eq(6)
    end

    it 'handles multiple numbers' do
      expect(calculator.add("1,2,3,4,5")).to eq(15)
    end

    it 'handles new lines between numbers' do
      expect(calculator.add("1\n2,3")).to eq(6)
    end

    it 'supports different delimiters' do
      expect(calculator.add("//;\n1;2")).to eq(3)
      expect(calculator.add("//|\n1|2|3")).to eq(6)
      expect(calculator.add("//sep\n2sep3")).to eq(5)
    end

    it 'raises an exception for negative numbers' do
      expect { calculator.add("1,-2,3") }.to raise_error(RuntimeError, "negative numbers not allowed: -2")
      expect { calculator.add("1,-2,-3") }.to raise_error(RuntimeError, "negative numbers not allowed: -2, -3")
    end

    it 'handles a mixture of delimiters and new lines' do
      expect(calculator.add("//;\n1;2\n3")).to eq(6)
    end
  end
end
