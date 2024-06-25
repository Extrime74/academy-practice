require 'rspec'
require 'stringio'
require_relative 'pokemons'

describe "#pokemons" do
  it "prints 'Массив покемонов пуст' if amount of pokemons is 0" do
    allow_any_instance_of(Object).to receive(:print)
    allow_any_instance_of(Object).to receive(:puts)
    input = StringIO.new("0\n")
    allow($stdin).to receive(:gets).and_return(input.string)

    expect { pokemons }.to output("Enter the number of pokemons: Массив покемонов пуст\n").to_stdout
  end

  it "creates an array of pokemons with capitalized names and colors" do
    allow_any_instance_of(Object).to receive(:print)
    allow_any_instance_of(Object).to receive(:puts)
    input = StringIO.new("2\nBulbasaur\ngreen\nCharmander\nred\n")
    allow($stdin).to receive(:gets).and_return(input.string)

    expected_output = "Enter the number of pokemons: Покемон 1.\nВведите имя: \nВведите цвет: \n" +
                      "Покемон 2.\nВведите имя: \nВведите цвет: \n\nМассив покемонов:\n[{:name=>\"Bulbasaur\", :color=>\"Green\"}, {:name=>\"Charmander\", :color=>\"Red\"}]\n"

    expect { pokemons }.to output(expected_output).to_stdout
  end
end