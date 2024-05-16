class Account
  BALANCE_FILE = "balance.txt"
  STARTING_BALANCE = 100.0

  def initialize
    @balance = File.exist?(BALANCE_FILE) ? File.read(BALANCE_FILE).to_f : STARTING_BALANCE
  end

  def deposit(amount)
    if amount > 0
      @balance += amount
      puts "Успешно.\n"
    else
      puts "Ошибка: Укажите допустимое значение (Больше, чем 0)\n"
    end
  end

  def withdraw(amount)
    if amount > 0 && amount <= @balance
      @balance -= amount
      puts "Успешно.\n"
    else
      if amount <= 0
        puts "Ошибка: Укажите допустимое значение (Больше, чем 0)\n"
      else
        puts "Ошибка: Недостаточно средств.\n"
      end
    end
  end

  def display_balance
    puts "Ваш баланс: #{@balance}\n"
  end

  def save_balance
    File.write(BALANCE_FILE, @balance.to_s)
  end
end

account = Account.new

loop do
  account.display_balance

  puts "Выберите действие: \n(D) Deposit, (W) Withdraw, (B) Balance, (Q) Quit"
  choice = gets.chomp.upcase

  case choice
  when "D"
    puts "Введите сумму для пополнения: "
    amount = gets.chomp.to_f
    account.deposit(amount)
  when "W"
    puts "Введите сумму для вывода: "
    amount = gets.chomp.to_f
    account.withdraw(amount)
  when "B"
    account.display_balance
  when "Q"
    puts "\nЗавершение программы. Ваш баланс: #{account.instance_variable_get(:@balance)}"
    account.save_balance
    break
  else
    puts "Некорректный ввод.\n"
  end
end