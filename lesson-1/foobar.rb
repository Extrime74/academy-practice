def foobar
  puts "Введи первое число:"
  first = gets.to_i
  puts "Введи второе число:"
  second = gets.to_i
  if first == 20 || second == 20
    puts "Результат: #{second}"
  else
    puts "Результат: #{first + second}"
  end
end
