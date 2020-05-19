module Enumerable

  def my_each(array)
    for element in array do
      yield element
    end
  end

  def my_each_with_index(array)
    for element in array do
      yield element, array.index(element)
    end
  end
  

  def my_all()?
  end

  def my

end

include Enumerable
array = %w[this is a beautiful array of strings]



# Enumerable.my_each(array) do |k|
#   puts k
# end

Enumerable.my_select(array) do |val|
  val != "beautiful"
end
