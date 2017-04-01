require 'enumerable.rb'

describe Enumerable do
    let(:array) { [1, 2, 3, 4, 5] }
    let(:empty_array) { [] }

    describe '#my_each' do
        context 'Without Block' do
            it 'returns an enumerator' do
                expect(array.my_each).to be_instance_of Enumerator
            end
        end

        context 'With Block' do
            it 'iterates through an array and applies block instructions' do
                expect(array.my_each { |x| empty_array << x + 1 }).to eql array
                expect(empty_array).to eql [2, 3, 4, 5, 6]
            end

            it 'returns empty array when given an empty array' do
                [].my_each { |x| empty_array << x + 1 }
                expect(empty_array).to eql []
            end
        end
    end # End my each
    describe '#my_select' do
        context 'Without Block' do
            it 'returns an enumerator' do
                expect(array.my_select).to be_instance_of Enumerator
            end
        end

        context 'With Block' do
            it 'Returns array that satisfies the block conditions ' do
                expect(array.select(&:even?)).to eql [2, 4]
            end

            it 'returns empty array when given an empty array' do
                expect(empty_array.select(&:even?)).to eql []
            end
        end
    end # End my select

    describe '#my_map' do
        context 'Without Block' do
            it 'returns an enumerator' do
                expect(array.my_map).to be_instance_of Enumerator
            end
        end

        context 'With Block' do
            it 'Returns array that satisfies the block conditions ' do
                expect(array.map{|a| 2 * a}).to eql [2,4,6,8,10]
            end

            it 'returns empty array when given an empty array' do
                expect(empty_array.map(&:even?)).to eql []
            end
        end
    end # End my select
end
