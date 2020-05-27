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
puts "my count \n"
puts days_of_the_week.my_count
puts '\n'

puts '*' * 50
puts "My Inject method \n"
puts (1...10).my_inject(:+)
puts '\n'

puts '*' * 50
puts "multiply_els([2,4,5]) \n"
puts multiply_els([2, 4, 5])
puts '\n'
