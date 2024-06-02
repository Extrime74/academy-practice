# frozen_string_literal: true

require_relative 'cash_machine'

RSpec.describe Account do
  let(:account) { Account.new(balance: 200.0) }

  describe '#deposit' do
    context 'when depositing a positive amount' do
      it 'increases the balance' do
        expect { account.deposit(50) }.to change { account.current_balance }.by(50)
      end

      it 'prints a success message' do
        expect { account.deposit(50) }.to output("Успешно.\n").to_stdout
      end
    end

    context 'when depositing a non-positive amount' do
      it 'does not change the balance' do
        expect { account.deposit(0) }.not_to(change { account.current_balance })
      end

      it 'prints an error message' do
        expect { account.deposit(0) }.to output(/Ошибка: Укажите допустимое значение/).to_stdout
      end
    end
  end

  describe '#withdraw' do
    context 'when withdrawing an amount within current balance' do
      it 'decreases the balance' do
        expect { account.withdraw(50) }.to change { account.current_balance }.by(-50)
      end

      it 'prints a success message' do
        expect { account.withdraw(50) }.to output("Успешно.\n").to_stdout
      end
    end

    context 'when withdrawing a non-positive amount or more than the balance' do
      it 'does not change the balance' do
        expect { account.withdraw(0) }.not_to(change { account.current_balance })
        expect { account.withdraw(300) }.not_to(change { account.current_balance })
      end

      it 'prints an error message' do
        expect { account.withdraw(0) }.to output(/Ошибка: Укажите допустимое значение/).to_stdout
        expect { account.withdraw(300) }.to output(/Ошибка: Недостаточно средств/).to_stdout
      end
    end
  end

  describe '#quit' do
    it 'writes the balance to the balance file' do
      allow(File).to receive(:write)
      account.quit
    end
  end
end
