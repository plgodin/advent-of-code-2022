input = File.readlines('04/input.txt')

def fully_overlaps?(a, b)
  a[0] <= b[0] && a[1] >= b[1] || b[0] <= a[0] && b[1] >= a[1]
end

# Convert all strings in input into a list of two start/end integers
# For example, "1-3,12-16" becomes [[1, 3], [12, 16]]
ranges = input.map do |line|
  line.split(",").map do |range|
    range.split("-").map(&:to_i)
  end
end

puts "Part 1:", ranges.count { |range| fully_overlaps?(range[0], range[1]) }

def overlap?(a, b)
  a[0] <= b[0] && a[1] >= b[0] || b[0] <= a[0] && b[1] >= a[0]
end

puts "Part 2:", ranges.count { |range| overlap?(range[0], range[1]) }
