input = File.readlines('03/input.txt')

def find_matching(a, b, c = nil)
  a.chars.each do |char|
    return char if b.include?(char) && (c.nil? || c.include?(char))
  end
  raise "No matching character found"
end

def priority(char)
  return char.ord - "a".ord + 1 if char >= "a" && char <= "z"
  return char.ord - "A".ord + 27 if char >= "A" && char <= "Z"
  raise "Invalid character #{char}"
end

priorities = input.map do |line|
  a = line.slice(0, line.length / 2)
  b = line.slice(line.length / 2, line.length / 2)

  find_matching(a, b)
end.map { |char| priority(char) }

puts "Part 1:", priorities.sum

badge_priorities = input.each_slice(3).map do |group|
  find_matching(*group)
end.map { |char| priority(char) }

puts "Part 2:", badge_priorities.sum
