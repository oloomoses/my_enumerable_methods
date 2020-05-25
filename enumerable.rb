module Enumerable

  def my_each
    return enum_for unless block_given?
    for element in self
      yield element
    end
  end

  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?
    self.my_each do |value, index|
      yield value, self.index(value)
    end
  end

  def my_select
    return to_enum(:my_select) unless block_given?
    result = []
    my_each do |element|
      if yield element
        result << element        
      end
    end
    puts result
  end

  def my_all?
    result = true
    my_each do |element|
      if block_given?
        result = false unless yield element
      else
        result = false if element == nil || element == false
      end
    end    
    puts result
  end
  
  def my_count(arg = nil)
    count = 0
    my_each do |element|
      if block_given?
        count += 1 if yield element
      elsif arg
        count += 1 if element == arg
      else
        count += 1 if element
      end
    end
    puts count
  end

  def my_any?(&block)
    result = false
    my_each do |element|
      if block_given?
        result = true unless block.call(element) == false || block.call(element) == nil
      else
        result = true if element
      end
    end
    puts result
  end

  def my_none?(&block)
    result = false
    my_each do |element|
      result = true unless block.call(element)
    end
    puts result  
  end

  def my_map(&block)
    return enum_for unless block_given?
    result = []
    my_each do |element|
      result << block.call(element)      
    end
    retult
  end
end

# array = %w[this is false a beautiful array of strings]

# array3 = [1, 33] 
# array3.my_all?{ |element| element.is_a? Integer}


array = [nil, false, false]

result = false

for i in array
  result = true if i
end

puts result