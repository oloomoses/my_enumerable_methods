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

  

  # def my_any?()
  # end

  # def my_none?()
  # end

end

array = %w[this is a beautiful array of strings]

array.my_all? do |val|
  val.size >= 1
end
