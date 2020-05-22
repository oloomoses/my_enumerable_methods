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

  def my_all?(arg = nil)
    if !block_given? && arg.nil?
      my_each { |element| return false unless element }
      break
    end
    result = true
    my_each do |element|
      result = false unless yield element
    end
    puts result
  end

  def my_count?(&block)
    count = 0
    my_each do |element|
      count += 1 if block.call(element)      
    end
    puts count
  end

  def my_any?(&block)
    result = []
    my_each do |element|
      result << block.call(element) 
    end

    if result.count(true) >= 1
      puts true
    else
      puts false
    end
    
  end

  def my_none?(&block)
    result = false
    my_each do |element|
      result = true unless block.call(element)
    end
    puts result  
  end

  def my_map(&block)
    result = []
    my_each do |element|
      result << block.call(element)      
    end
    retult
  end
end

array = %w[this is a beautiful array of strings]

array.my_all?(true)
