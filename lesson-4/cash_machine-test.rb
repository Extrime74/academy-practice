require_relative 'cash_machine'

RSpec.describe Account do
  let(:starting_balance) { 100.0 }
  let(:input) { StringIO.new }
  let(:output) { StringIO.new }

  before do
    @account = Account.new(starting_balance)
    allow_any_instance_of(Account).to receive(:gets).and_return(input)
    allow($stdout).to receive(:puts).and_return(output)
  end

  describe '#deposit' do
    it 'increases the balance for a valid deposit amount' do
      input.puts "50"
      input.rewind
      @account.deposit
      expect(@account.current_balance).to eq(starting_balance + 50)
    end

    it 'does not change the balance for an invalid deposit amount' do
      input.puts "-20"
      input.rewind
      @account.deposit
      expect(@account.current_balance).to eq(starting_balance)
    end
  end

  describe '#withdraw' do
    it 'decreases the balance for a valid withdrawal amount' do
      input.puts "30"
      input.rewind
      @account.withdraw
      expect(@account.current_balance).to eq(starting_balance - 30)
    end

    it 'does not change the balance for an invalid withdrawal amount' do
      input.puts "200"
      input.rewind
      @account.withdraw
      expect(@account.current_balance).to eq(starting_balance)
    end
  end

  describe '#quit' do
    it 'saves the balance to a file and ends the program' do
      expect(File).to receive(:write).with(Anything, starting_balance.to_s)
      @account.quit
    end
  end
end