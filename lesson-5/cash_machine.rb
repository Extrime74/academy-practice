BALANCE_FILE = "balance.txt"
STARTING_BALANCE = 100.0

class Account
  attr_reader :current_balance

  def initialize
    @balance = File.exist?(BALANCE_FILE) ? File.read(BALANCE_FILE).to_f : STARTING_BALANCE
  end

  def deposit(amount)
    initialize
    @balance += amount
    File.write(BALANCE_FILE, @balance)
    "Выполнено пополнение счета на #{amount}. Текущий баланс: #{@balance}"
  end

  def withdraw(amount)
    initialize
    if @balance >= amount
      @balance -= amount
      File.write(BALANCE_FILE, @balance)
      "Выполнено снятие средств на #{amount}. Текущий баланс: #{@balance}"
    else
      "Недостаточно средств на счете. Текущий баланс: #{@balance}"
    end
  end

  def balance
    initialize
    "Текущий баланс: #{@balance}"
  end
end