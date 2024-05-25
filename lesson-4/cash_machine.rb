BALANCE_FILE = "balance.txt"
STARTING_BALANCE = 100.0

class Account
  attr_reader :current_balance

  def initialize
    @balance = File.exist?(BALANCE_FILE) ? File.read(BALANCE_FILE).to_f : STARTING_BALANCE
  end

  def deposit
    print "Введите сумму для пополнения: "
    amount = gets.chomp.to_i
    if amount > 0
      @balance += amount
      puts "Успешно.\n"
    else
      puts "Ошибка: Укажите допустимое значение (Больше, чем 0)\n"
    end
  end

  def withdraw
    print "Введите сумму для вывода: "
    amount = gets.chomp.to_i
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

  def quit
    puts "\nЗавершение программы.\nВаш баланс: #{@balance}"
    File.write(BALANCE_FILE, @balance)
    false
  end


  def init
    flag = true
    while flag
      puts "\nВыберите действие: "
      puts '(D) Deposit'
      puts '(W) Withdraw'
      puts '(B) Balance'
      puts '(Q) Quit'
      mode = gets.chomp.upcase
      case mode
      when "D"
        deposit
      when "W"
        withdraw
      when "B"
        puts "\nТекущий баланс: #{@balance}"
      when "Q"
        flag = quit
      else
        puts "Некорректный ввод.\n"
      end
    end
  end
end
