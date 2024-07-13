require_relative 'methods'
require 'rspec'

RSpec.describe "Methods" do
  before(:each) do
    File.open(TASK_FILE, 'w') {|file| file.truncate(0) }
    File.open(TASK_FILE, 'a') {|file| file.puts("Актер 1", "Актер 2", "Antonio Banderas")}
  end

  it "выводит список актеров" do
    expect { index }.to output("Актер 1\nАктер 2\nAntonio Banderas\n").to_stdout
  end

  it "находит артиста по id" do
    expect { find(2) }.to output("Актер 2\n").to_stdout
  end

  it "возвращает индекс актера, соответствующего шаблону" do
    expect(where("Antonio")).to eq(2)
  end

  it "обновляет имя актера на новое" do
    update(1, "Новое Имя Актера")
    expect(File.read(TASK_FILE)).to include("Новое Имя Актера")
  end

  it "удаляет актера по id" do
    delete(1)
    expect(File.read(TASK_FILE)).not_to include("Актер 1")
  end

  it "добавляет нового актера в файл" do
    create("Новый Актер")
    expect(File.read(TASK_FILE)).to include("Новый Актер")
  end
end