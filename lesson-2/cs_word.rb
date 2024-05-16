def cs_word
  puts 'Введите слово: '
  word = gets.chomp
  if word.downcase[-2..] == 'cs'
    2**word.length
  else
    word.reverse
  end
end

puts cs_word
