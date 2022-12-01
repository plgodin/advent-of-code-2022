elves = File.readlines('01/input.txt').map(&:to_i).slice_after(0).map(&:sum)

puts "Part 1:", elves.max

puts "Part 2:", elves.max(3).sum
