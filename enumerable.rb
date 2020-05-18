module Enumerable

  def my_each(array)
    for element in array do
      yield element
    end
  end
  
  def my_each_with_index(array)
    for element in array do
      yield array.index(element), element
    end
  end

end

include Enumerable
array = %w[this is a beautiful array of strings]

Enumerable.my_each_with_index(array) do |i, e|
  p "#{i}: #{e}"
end
