TASK_FILE = 'artists.txt'
BUFFER = 'buffer.txt'

def index
	File.foreach(TASK_FILE) { |actor| puts actor }
end


def find(id)
  line_num = 0

  File.foreach(TASK_FILE) do |line|
    line_num += 1
    puts line if line_num == id.to_i
  end
end


def where(pattern)
	File.foreach(TASK_FILE).with_index do |actor, index|
    	@actor_id = index if actor.include?(pattern)
    end

    @actor_id
end


def update(id, name)
	file = File.open(BUFFER, "w")
	File.foreach(TASK_FILE).with_index do |actor, index|
		file.puts(id == index ? name : actor)
	end

	file.close
	File.write(TASK_FILE, File.read(BUFFER))
	File.delete(BUFFER) if File.exist?(BUFFER)
end


def delete(id)
  lines = File.readlines(TASK_FILE)
  
  if id.to_i <= lines.length
    deleted_artist = lines.delete_at(id.to_i - 1)

    File.open(TASK_FILE, 'w') do |file|
      file.puts lines
    end

    deleted_artist
  else
    puts "ID out of range"
  end
end


def create(name)
	File.open(TASK_FILE, "a") do |file|
    	file.puts(name)
	end
end