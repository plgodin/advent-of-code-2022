input = File.readlines('07/input.txt').map(&:chomp)

filesystem = {}
current_path = ["C:"]

input.each do |line|
  case line
  when "$ cd .."
    current_path.pop
  when /^(\d+)/
    current_path.length.times do |i|
      p = current_path.first(i + 1).join('/')
      filesystem[p] ||= 0
      filesystem[p] += $1.to_i
    end
  when /^\$ cd (\w+)/
    current_path << $1
  end
end

puts "Part 1:", filesystem.filter { |_, v| v <= 100000 }.sum { |_, v| v }

free_space = 70000000 - filesystem["C:"]
needed_space = 30000000 - free_space
smallest = filesystem.min_by { |_, v| (needed_space - v).abs }

puts "Part 2:", smallest[1]
