require_relative 'cash_machine'

RSpec.describe Account do
  let(:balance_file) { "balance.txt" }
  let(:starting_balance) { 100.0 }

  before do
    @account = Account.new
    # Перехват и переопределение stdout
    @original_stdout = $stdout
    $stdout = StringIO.new
  end

  after do
    $stdout = @original_stdout
    File.delete(balance_file) if File.exist?(balance_file)
  end

  describe '#deposit' do
    it 'increases the balance for valid deposit amount' do
      @account.deposit(50.0)
      expect(@account.instance_variable_get(:@balance)).to eq(starting_balance + 50.0)
    end

    it 'does not change the balance for invalid deposit amount' do
      @account.deposit(-20.0)
      expect(@account.instance_variable_get(:@balance)).to eq(starting_balance)
    end
  end

  describe '#withdraw' do
    it 'decreases the balance for valid withdrawal amount' do
      @account.withdraw(30.0)
      expect(@account.instance_variable_get(:@balance)).to eq(starting_balance - 30.0)
    end

    it 'does not change the balance for invalid withdrawal amount' do
      @account.withdraw(200.0)
      expect(@account.instance_variable_get(:@balance)).to eq(starting_balance)
    end
  end

  describe '#display_balance' do
    it 'displays the current balance' do
      expect { @account.display_balance }.to output("Ваш баланс: #{starting_balance}\n").to_stdout
    end
  end
end