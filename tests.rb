require_relative 'enumerable.rb'

days_of_the_week = {
  mon: 'Monday',
  tue: 'Tuesday',
  wed: 'Wednesday',
  thurs: 'Thursday',
  fri: 'Friday',
  sat: 'Saturday',
  sun: 'Sunday'
}

a = %w[a b c d e f]
array1 = %w[ant bear cat]
array2 = [1, 2, 3, 4, 5, 6]

puts '*' * 50
puts "my each method \n"
(1..5).my_each { |element| p element }
puts '\n'

puts '*' * 50
puts "my_each_with_index \n"
hash = {}
%w[cat dog wombat].my_each_with_index { |item, index| hash[item] = index }
puts hash
puts '\n'

puts '*' * 50
puts "my select method \n"
puts array2.my_select { |num| num.even? }
puts '\n'

puts '*' * 50
puts "my all \n"
puts array1.my_all? { |word| word.length >= 4 }
puts array1.my_all? { |word| word.length >= 3 }
puts '\n'

puts '*' * 50
puts "my any \n"
puts array1.my_any? { |word| word.length >= 3 }
puts '\n'

puts '*' * 50
puts "my none \n"
puts %w[ant bear cat].my_none? { |word| word.length >= 4 }
puts '\n'

puts '*' * 50
puts "my count \n"
puts days_of_the_week.my_count
puts '\n'

puts '*' * 50
puts "my map \n"
p a.collect { |x| x + '!' }
puts '\n'

puts '*' * 50
puts "My Inject method \n"
puts (1...10).my_inject(:+)
puts '\n'

puts '*' * 50
puts "multiply_els([2,4,5]) \n"
puts multiply_els([2, 4, 5])
puts '\n'
