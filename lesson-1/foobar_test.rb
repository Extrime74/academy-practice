require 'rspec'
require_relative 'foobar'

describe "#foobar" do
  context "когда первое или второе число равно 20" do
    it "возвращает второе число" do
      expect { foobar(20, 10) }.to output("Результат: 10\n").to_stdout
    end

    it "возвращает второе число, если 20 передано в качестве второго аргумента" do
      expect { foobar(5, 20) }.to output("Результат: 20\n").to_stdout
    end
  end

  context "когда ни первое, ни второе число не равно 20" do
    it "возвращает сумму двух чисел" do
      expect { foobar(5, 10) }.to output("Результат: 15\n").to_stdout
    end

    it "возвращает правильную сумму для отрицательных чисел" do
      expect { foobar(-5, -10) }.to output("Результат: -15\n").to_stdout
    end
  end
end
