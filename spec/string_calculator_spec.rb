require 'rspec'
require_relative '../lib/string_calculator.rb'

RSpec.describe StringCalculator do
    describe 'add' do
        it 'returns 0 for an empty string' do
            expect(StringCalculator.add("")).to eq(0)
        end

        it 'returns the number itself for a single number string' do
            expect(StringCalculator.add("1")).to eq(1)
        end

        it 'returns sum of two numbers' do
            expect(StringCalculator.add("1,2")).to eq(3)
        end

        it 'returns sum of multiple numbers' do
            expect(StringCalculator.add("1,2,3")).to eq(6)
        end

        it 'does not return incorrect sum' do
            expect(StringCalculator.add("1,2,3")).not_to eq(10)
        end

        it 'returns 0 for a nil value' do
            expect(StringCalculator.add(nil)).to eq(0)
        end

        it 'returns the number itself for a single digit' do
            expect(StringCalculator.add(100)).to eq(100)
        end

        it 'handles new lines between numbers' do
            expect(StringCalculator.add("1\n2,3")).to eq(6)
        end

        it 'handles space between numbers' do
            expect(StringCalculator.add("1 2 3")).to eq(6)
        end

        it 'support different delimiters' do
            expect(StringCalculator.add("//;\n1;2")).to eq(3)
        end

        it 'support different delimiters without new line' do
            expect(StringCalculator.add("//;1;2")).to eq(3)
        end

        it 'support multiple different delimiters' do
            expect(StringCalculator.add("1\n2,3;4")).to eq(10)
        end

        it 'raise an exception for negetive number' do
            expect{ (StringCalculator.add("1,2,3,-4")) }.to raise_error("Negetive numbers not allowed: -4")
        end

        it 'raise an exception for multiple negetive numbers' do
            expect{ (StringCalculator.add("1,2,3,-4,-6")) }.to raise_error("Negetive numbers not allowed: -4, -6")
        end
    end
end
