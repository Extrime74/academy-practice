# frozen_string_literal: true

class Account
  attr_reader :current_balance

  BALANCE_FILE = 'balance.txt'

  def initialize(balance: nil)
    @balance = if balance.nil?
                 File.exist?(BALANCE_FILE) ? File.read(BALANCE_FILE).to_f : STARTING_BALANCE
               else
                 balance
               end
  end

  def deposit(amount = gets.chomp.to_i)
    if amount.positive?
      @balance += amount
      puts "Успешно.\n"
    else
      puts "Ошибка: Укажите допустимое значение (Больше, чем 0)\n"
    end
  end

  def current_balance
    @balance
  end

  def withdraw(amount = gets.chomp.to_i)
    if amount.positive? && amount <= @balance
      @balance -= amount
      puts "Успешно.\n"
    elsif amount <= 0
      puts "Ошибка: Укажите допустимое значение (Больше, чем 0)\n"
    else
      puts "Ошибка: Недостаточно средств.\n"
    end
  end

  def quit
    puts "\nЗавершение программы.\nВаш баланс: #{@balance}"
    File.write(BALANCE_FILE, @balance)
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
      when 'D'
        deposit
      when 'W'
        withdraw
      when 'B'
        puts "\nТекущий баланс: #{@balance}"
      when 'Q'
        flag = false
        quit
      else
        puts "Некорректный ввод.\n"
      end
    end
  end
end
