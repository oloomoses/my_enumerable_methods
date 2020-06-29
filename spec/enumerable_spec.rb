require './enumerable.rb'

describe Enumerable do
  let(:array) { %w[one two three four two] }
  let(:array2) { [4, 8, 2, 0, 1] }
  describe '#my_each' do
    it 'takes a block and return element an array when block is given' do
      expect(array.my_each { |elem| print "#{elem} " })
    end

    it 'returns enumrator object if block id not given' do
      expect(array.my_each).to be_an(Enumerator)
    end
  end

  describe '#each_with_index' do
    it 'returns elements of an array with their indeces' do
      expect(array.my_each_with_index { |value, index| puts "#{index} => #{value}" })
    end

    it 'returns an enumerator if block is not given' do
      expect(array.my_each_with_index).to be_a(Enumerator)
    end
  end

  describe '#my_select' do
    it 'returns an array of selected elements if block is given' do
      expect(array.my_select { |elem| elem == 'one' }).to eql(['one'])
    end

    it 'returns an enumerator if no block is given' do
      expect(array.my_select).to be_an(Enumerator)
    end
  end

  describe '#my_all?' do
    it 'returns true if the block given is true' do
      expect(array.my_all? { |elem| elem.length > 2 }).to eq(true)
    end

    it 'returns true if elements in array is no nil or false' do
      expect(array.my_all?).to eq(true)
    end
  end

  describe '#my_count(arg = nil)' do
    it 'returns the number of elements that results to true when block is given' do
      expect(array.my_count { |elem| elem.length > 3 }).to eq(2)
    end

    it 'returns total counts if an argument is given' do
      expect(array.my_count('two')).to eq(2)
    end

    it 'returns the total count of the array element if block is not given' do
      expect(array.my_count).to eq(5)
    end
  end

  describe '#my_any?' do
    it 'returns true if result of the block given is true' do
      expect(array.my_any? { |elem| elem == 'two' }).to eq(true)
    end

    it 'returns true if any of the elemets an array is true' do
      expect(array.my_any?).to eq(true)
    end
  end

  describe '#my_none?' do
    it 'returns false if block is true' do
      expect(array.my_none? { |elem| elem.length > 2 }).to eq(false)
    end

    it 'returns false if block is not given and array element is true' do
      expect(array.my_none?).to eq(false)
    end
  end

  describe '#my_map' do
    it '#returns an new array of the modified elements' do
      expect(array2.my_map { |elem| elem * 2 }).to eq([8, 16, 4, 0, 2])
    end

    it 'returns enumerator is no block or proc is given' do
      expect(array2.my_map).to be_an(Enumerator)
    end
  end

  describe '#my_inject' do
    it 'performs an operation depending on the symbol given' do
      expect(array2.my_inject(:+)).to eq(15)
    end

    it 'perfoms operation to a block' do
      expect(array2.my_inject(0) { |initial, actual| initial * actual }).to eq(0)
    end
  end
end
