require_relative "cash_machine"
require_relative "app" # Предполагается, что ваш файл с классом App называется app.rb
require "rack"
require "rspec"

RSpec.describe "App" do
  let(:app) { App.new }

  describe "#cash_machine_controller" do
    it "should deposit money into the account" do
      params = { 'method' => 'deposit', 'amount' => '100' }
      result = cash_machine_controller(params)
      expect(result).to include("Выполнено пополнение счета на 100.")
      expect(result).to match(/Текущий баланс: \d+\.\d+/)
    end

    it "should withdraw money from the account" do
      params = { 'method' => 'withdraw', 'amount' => '50' }
      result = cash_machine_controller(params)
      expect(result).to include("Выполнено снятие средств на 50.")
      expect(result).to match(/Текущий баланс: \d+\.\d+/)
    end
  end
end
