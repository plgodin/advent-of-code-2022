input = File.readlines('10/input.txt').map(&:chomp)

x = 1
cycles = []

input.each do |line|
  /(\w{4}) ?(\-?\d+)?/ =~ line
  case $1
  when 'noop'
    cycles << x
  when 'addx'
    cycles += [x] * 2
    x += $2.to_i
  end
end

signal_indices = (20..220).step(40).to_a

puts "Part 1:", signal_indices.map { |i| cycles[i-1] * i }.sum

puts "Part 2:"

cycles.each_with_index do |sprite, i|
  print (sprite - i % 40).abs <= 1 ? "🟩" : "⬛️"
  print "\n" if (i + 1) % 40 == 0
end
