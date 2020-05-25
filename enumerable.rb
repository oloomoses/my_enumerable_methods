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
        result = true if element
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

  def my_any?
    result = false
    my_each do |element|
      if block_given?
        result = true if yield element 
      else
        result = true if element || self[]
      end
    end
    puts result
  end

  def my_none?
    result = true
    my_each do |element|
      if block_given?
        result = false if yield element
      else
        result = false if element
      end
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

  def my_inject(initial = 0, operand = nil)
    
    my_each do |element|
      if block_given?
        initial = yield(initial, element)
      elsif initial && operand
        initial = init operand element
      end
    end 
    puts initial   
  end
end

array = [3, 4, 3, 2, 1]

array.my_inject(2, *)

# longest = %w{ cat sheep bear }.my_inject do |memo, word|
#   memo.length > word.length ? memo : word
# end
# longest 