def foobar(first, second)
  if first == 20 or second == 20
    puts "Результат: #{second}"
  else
    puts "Результат: #{first + second}"
  end
end

puts "Введи первое число:"
first_number = gets.to_i
puts "Введи второе число:"
second_number = gets.to_i
