require 'rspec'
require_relative '../lib/string_calculator.rb'

RSpec.describe StringCalculator do
    describe 'add' do
        it 'returns 0 for an empty string' do
            expect(StringCalculator.add("")).to eq(0)
        end
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
end
