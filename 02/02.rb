input = File.readlines('02/input.txt')

score = input.map(&:split).map do |line|
  ((line.last.ord - line.first.ord + 2) % 3 * 3) + line.last.ord - "W".ord
end

puts "Part 1:", score.sum

score = input.map(&:split).map do |line|
  win = line.last.ord - "X".ord
  win * 3 + (line.first.ord + win) % 3 + 1
end

puts "Part 2:", score.sum
