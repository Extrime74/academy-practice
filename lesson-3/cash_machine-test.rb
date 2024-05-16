require 'stringio'
require_relative 'cash_machine'

RSpec.describe '#cash_machine' do
  before do
    @original_stdout = $stdout
    @original_stdin = $stdin
    $stdout = StringIO.new
    $stdin = StringIO.new("d\n50\nw\n60\nw\n40\nb\nq\n")
  end

  after do
    $stdout = @original_stdout
    $stdin = @original_stdin
  end

  it 'правильно обрабатывает действия по вводу, выводу средств, проверке баланса и выходу' do
    load 'cash_machine.rb'

    expected_output = "Ваш баланс: 100.0\nВведите сумму для пополнения: \nУспешно.\n \nВведите сумму для вывода: \nУспешно.\n \n" \
                      "Ошибка: Недостаточно средств.\n \nВаш баланс: 90.0\n \nЗавершение программы. Ваш баланс: 90.0\n"

    expect($stdout.string).to eq(expected_output)
  end
end