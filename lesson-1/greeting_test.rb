require 'rspec'
require_relative 'greeting'

describe "#greeting" do
  context "когда возраст меньше 18" do
    it "печатает сообщение, призывающее начать изучать программирование" do
      expect { greeting("Alice", "Smith", 16) }.to output("Привет, Alice Smith. Тебе меньше 18 лет, но начать учиться программировать никогда не рано\n").to_stdout
    end
  end

  context "когда возраст 18 лет или старше" do
    it "печатает сообщение о том, что пора приступить к работе" do
      expect { greeting("Bob", "Johnson", 20) }.to output("Привет, Bob Johnson. Самое время заняться делом!\n").to_stdout
    end
  end
end