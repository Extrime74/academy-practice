require 'rspec'
require 'stringio'
require_relative 'cs_word'

describe "#cs_word" do
  it "returns 2 to the power of the word's length if word ends with 'cs'" do
    allow_any_instance_of(Object).to receive(:puts)
    input = StringIO.new("OpenAIcs\n")
    allow($stdin).to receive(:gets).and_return(input.string)

    expect { cs_word }.to output("Enter a word: \n").to_stdout.and output("64\n").to_stdout
  end

  it "returns the reversed word if word does not end with 'cs'" do
    allow_any_instance_of(Object).to receive(:puts)
    input = StringIO.new("Hello\n")
    allow($stdin).to receive(:gets).and_return(input.string)

    expect { cs_word }.to output("Enter a word: \n").to_stdout.and output("olleH\n").to_stdout
  end
end
