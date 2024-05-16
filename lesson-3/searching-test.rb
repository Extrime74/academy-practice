require_relative 'searching'

RSpec.describe 'SearchPeople' do
  let(:task_file) { 'people_list.txt' }
  let(:results_file) { 'results.txt' }

  before do
    @people_data = "Василий 25\nМаксим 30\nИлья 35\nМихаил 40\nЕвгений 25"
    File.write(task_file, @people_data)
  end

  after do
    File.delete(task_file) if File.exist?(task_file)
    File.delete(results_file) if File.exist?(results_file)
  end

  describe '#read_file' do
    it 'reads the people list from the file' do
      expect(read_file).to eq(@people_data.split("\n"))
    end
  end

  describe '#search_by_list' do
    it 'searches and writes results to the file based on age' do
      people_list = @people_data.split("\n")
      search_by_list(people_list, '25') # Search for age 25
      expect(File.read(results_file)).to include("Василий 25\nЕвгений 25\n")
    end
  end

  describe '#result' do
    it 'reads the result data from the file' do
      File.write(results_file, "Василий 25\nМаксим 30")
      expect(result).to eq(["Василий 25", "Максим 30"])
    end
  end

  describe '#main' do
    it 'executes the main program' do
      allow(self).to receive(:gets).and_return('25', '-1') # Input: '25', '-1'
      expect { main }.to output(/Василий 25\nЕвгений 25\nФайл 'results.txt' сохранен/).to_stdout
    end
  end
end