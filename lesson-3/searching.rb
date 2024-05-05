TASK_FILE = 'people_list.txt'
RESULTS = 'results.txt'

def read_file
  people_list = []
  File.foreach(TASK_FILE) do |line|
    people_list << line.chomp
  end
  people_list
end

def search_by_age
  print "Введите возраст или '-1' чтобы выйти: "
  age = gets.chomp
  while age.to_i <= 0 && age.to_i != -1
    puts "Неверное значение.\nВведите возраст или '-1' чтобы выйти: "
    age = gets.chomp
  end
  age
end

def search_by_list(people_list, age)
  id = 0
  while id < people_list.size
    if people_list[id].scan(/\b\d{1,2}\b/).first == age
      File.write(RESULTS, "#{people_list[id]}\n", mode: 'a')
      people_list.delete_at(id)
    else
      id += 1
    end
  end
  people_list	
end

def result
  result_data = []
  File.foreach(RESULTS) do |line|
    result_data << line.chomp
  end
  result_data
end

def main
  people_list = read_file
  search_age = 0
  File.write(RESULTS, '')
  while !people_list.empty? && search_age.to_i != -1
    search_age = search_by_age
    people_list = search_by_list(people_list, search_age)
    puts(search_age.to_i == -1 ? "" : "Поиск завершен")
  end
  result_data = result
  if result_data.empty?
    puts "Файл с результатом пуст."
  else
    puts "Файл 'results.txt' сохранен."
  end
end

main
