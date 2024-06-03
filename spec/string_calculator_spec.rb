require 'rspec'
require_relative '../lib/string_calculator.rb'

RSpec.describe StringCalculator do
    describe 'add' do
        it 'returns 0 for an empty string' do
            expect(StringCalculator.add("")).to eq(0)
        end
    end

    it 'returns the number for a single number string' do
        expect(StringCalculator.add("1")).to eq(1)
    end
end