input = File.read('06/input.txt')

def find_first_unique(input, n)
  input.chars.each_cons(n).find_index { |chars| chars.uniq.size == n } + n
end

puts "Part 1:", find_first_unique(input, 4)

puts "Part 2:", find_first_unique(input, 14)
