require_relative 'cash_machine'




RSpec.describe Account do
  describe "#deposit" do
    it "should deposit money into the account and update balance" do
      account = Account.new
      initial_balance = 100.0
      deposit_amount = 50.0
      expected_balance = initial_balance + deposit_amount

      result = account.deposit(deposit_amount)

      expect(result).to eq("Выполнено пополнение счета на #{deposit_amount}. Текущий баланс: #{expected_balance}")
      expect(account.balance).to eq(expected_balance)
    end
  end

  describe "#withdraw" do
    it "should withdraw money from the account if sufficient balance" do
      account = Account.new
      account.deposit(100.0)
      initial_balance = account.balance.to_f
      withdraw_amount = 50.0
      expected_balance = initial_balance - withdraw_amount

      result = account.withdraw(withdraw_amount)

      expect(result).to eq("Выполнено снятие средств на #{withdraw_amount}. Текущий баланс: #{expected_balance}")
      expect(account.balance).to eq(expected_balance)
    end

    it "should not withdraw money if insufficient balance" do
      account = Account.new
      account.deposit(50.0)
      withdraw_amount = 100.0

      result = account.withdraw(withdraw_amount)

      expect(result).to eq("Недостаточно средств на счете. Текущий баланс: #{account.balance}")
    end
  end

  describe "#balance" do
    it "should return the current balance of the account" do
      account = Account.new
      account.deposit(27200.0)

      result = account.balance

      expect(result).to eq(account.balance)
    end
  end
end
