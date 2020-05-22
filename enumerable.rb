module Enumerable

  def my_each
    for element in self
      yield element
    end
  end

  def my_each_with_index
    self.my_each do |value, index|
      yield value, self.index(value)
    end
  end

  def my_select
    result = []
    self.my_each do |element|
      if (yield element)
        result << element        
      end
    end
    puts result
  end

  def my_all?(&block)
    result = true
    self.my_each do |element|
      result = false unless block.call(element)
    end
    puts result
  end

  # def my_any?()
    
  # end

  def my_none?(&block)
    result = false
    self.my_each do |element|
      result = true unless block.call(element)
    end
    puts result  
  end

  def my_map(&block)
    result = []
    self.my_each do |element|
      result << block.call(element)
    end
    retult
  end
end

array = %w[this is a beautiful array of strings]

array.my_all? do |val|
 val.length > 1
end
