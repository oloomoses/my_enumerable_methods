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
    result
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
    result
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
   count
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
    result
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
    result 
  end

  def my_map(proc = nil)
    return enum_for unless block_given?
    result = []
    my_each do |element|
      if proc
        result << yield(element)
      else        
        result << proc.call(element)
      end
    end
    retult
  end

  def my_inject(init = nil, operand = nil, &block)
    block = operand.to_proc if operand.is_a?(Symbol)
    block, init = init.to_proc, nil if init.is_a?(Symbol) && !operand

    my_each { |element| init = init.nil? ? element : block.call(init,element)}
    init
  end  
end

def multiply_els(array)
  array.my_inject(:*)
end

