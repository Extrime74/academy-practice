BALANCE_FILE = "balance.txt"
STARTING_BALANCE = 100.0

balance = File.exist?(BALANCE_FILE) ? File.read(BALANCE_FILE).to_f : STARTING_BALANCE

loop do
  puts "Ваш баланс: #{balance}"

  puts "Выберите действие: \n(D) Deposit, (W) Withdraw, (B) Balance, (Q) Quit"
  choice = gets.chomp.upcase

  case choice
  when "D"
    puts "Введите сумму для пополнения: "
    amount = gets.chomp.to_f
    if amount > 0
      balance += amount
      puts "Успешно.\n "
    else
      puts "Ошибка: Укажите допустимое значение (Больше, чем 0)\n "
    end
  when "W"
    puts "Введите сумму для вывода: "
    amount = gets.chomp.to_f
    if amount > 0 && amount <= balance
      balance -= amount
      puts "Успешно.\n "
    else
      if amount <= 0
        puts "Ошибка: Укажите допустимое значение (Больше, чем 0)\n "
      else
        puts "Ошибка: Недостаточно средств.\n "
      end
    end
  when "B"
    puts "Ваш баланс: #{balance}\n "
  when "Q"
    puts "\nЗавершение программы. Ваш баланс: #{balance}"
    File.write(BALANCE_FILE, balance.to_s)
    break
  else
    puts "Некорректный ввод.\n "
  end
end
