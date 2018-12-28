require './lib/enumerable_methods.rb'

RSpec.describe Enumerable do
  let(:arr) { [1, 2, 3, 4, 5, 6, 7] }
  let(:newarr) { [] }

  describe '#my_each' do
    context 'when block given'
    it 'belongs to the Enumerable class' do
      expect(arr.my_each.is_a? Enumerable).to be true
    end
    it 'executes the block using the array values' do
      expect(arr.my_each { |n| n }).to eql(arr)
    end
    it 'executes the block and manipulation' do
      expect(newarr << arr.my_each { |n| n + 2 }).to eql(newarr)
    end
    it 'is not modifying the original array' do
      expect(arr.my_each { |n| n * n}).to eql(arr)
    end
  end

  describe '#my_each_with_index' do
    it 'returns an array of preperly manipulated variables' do
      arr.my_each_with_index { |n, i| newarr << n * i }
      expect(newarr).to eql(newarr)
    end
  end

  describe '#my_any?' do
    context 'when block given'
    it 'returns true if the block returns at least one value other than false or nil' do
      expect(arr.my_any? { |n| n == 1 }).to be true
    end
    it 'returns false if all the elements are nil or false' do
      expect([false, nil].my_any?).to be false
    end

    context 'when no block is given'
    it 'returns true if at least one element is not false or nil' do
      expect(arr.my_any?).to be true
    end
    it 'returns false for an empty array' do
      expect([].my_any?).to be false
    end
  end

  describe '#my_count' do
    it 'returns the number of elements if no block is given' do
      expect(arr.my_count).to eq(7)
    end
    it 'returns number of even elements' do
      expect(arr.my_count {|n| n % 2 == 0}).to eq(3)
    end
  end
end
