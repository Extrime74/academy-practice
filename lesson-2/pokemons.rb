def pokemons
  print 'Введите количество покемонов: '
  amount_of_pokemons = gets.chomp.to_i
  if amount_of_pokemons == 0
    puts 'Массив покемонов пуст'
  else
    pokemons_array = []
    amount_of_pokemons.times do |i|
      puts "Покемон #{i + 1}."
      print 'Введите имя: '
      name = gets.chomp
      print 'Введите цвет: '
      color = gets.chomp
      pokemons_array << [name: name.capitalize, color: color.capitalize]
    end
    puts "\nМассив покемонов:"
    puts pokemons_array
  end
end

pokemons
