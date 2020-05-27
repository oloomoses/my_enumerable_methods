module Enumerable
  def my_each
    return enum_for unless block_given?

    i = 0
    array = self
    while i < size
      yield array[i] if is_a?(Array)
      yield to_a[i] if is_a?(Range)
      yield to_a[i] if is_a?(Hash)
      i += 1
    end
    array
  end

  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?

    array = self
    my_each do |value|
      yield value, array.index(value)
    end
  end

  def my_select
    return to_enum(:my_select) unless block_given?

    result = []
    my_each do |element|
      result << element if yield element
    end
    result
  end

  def my_all?
    result = true
    my_each do |element|
      if block_given?
        result = false unless yield element
      elsif element
        result = true
      else
        result = false
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
      elsif element
        count += 1
      end
    end
    count
  end

  def my_any?
    result = false
    my_each do |element|
      if block_given?
        result = true if yield element
      elsif element || self[]
        result = true
      end
    end
    result
  end

  def my_none?
    result = true
    my_each do |element|
      if block_given?
        result = false if yield element
      elsif element
        result = false
      end
    end
    result
  end

  def my_map(proc = nil)
    return enum_for unless block_given?

    result = []
    my_each do |element|
      result << yield(element) unless proc
      result << proc.call(element) if proc
    end
    retult
  end

  def my_inject(init = nil, operand = nil, &block)
    block = operand.to_proc if operand.is_a?(Symbol)
    if init.is_a?(Symbol) && !operand
      block = init.to_proc
      init = nil
    end

    my_each { |element| init = init.nil? ? element : block.call(init, element) }
    init
  end
end

def multiply_els(array)
  array.my_inject(:*)
end
