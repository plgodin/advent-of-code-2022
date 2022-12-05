input = File.readlines('05/input.txt')

def parse_crates(input)
  towers = Array.new(9) { [] }
  crate_positions = Array.new(9) { |i| i * 4 + 1 }
  crate_lines = input.take_while { |line| line[1] != '1' }
  crate_lines.each do |line|
    line.chars.values_at(*crate_positions).each.with_index do |crate, tower|
      towers[tower] << crate if crate && crate != ' '
    end
  end
  towers.map(&:reverse)
end

towers = parse_crates(input)
instructions = input.drop_while { |line| line != "\n" }.drop(1)

instructions.each do |instruction|
  nb, origin, dest = instruction.match(/move (\d+) from (\d+) to (\d+)/i).captures
  nb.to_i.times { towers[dest.to_i - 1] << towers[origin.to_i - 1].pop }
end

puts "Part 1:", towers.map(&:last).join

towers = parse_crates(input)

instructions.each do |instruction|
  nb, origin, dest = instruction.match(/move (\d+) from (\d+) to (\d+)/i).captures
  towers[dest.to_i - 1].append(*towers[origin.to_i - 1].pop(nb.to_i))
end

puts "Part 2:", towers.map(&:last).join
