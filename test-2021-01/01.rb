nbDepthIncreased = 0
currentDepth = 9999

File.foreach('01/input.csv') do |depth|
  nbDepthIncreased += 1 if depth.to_i > currentDepth
  currentDepth = depth.to_i
end

puts "Part1=", nbDepthIncreased

nbDepthIncreased = 0
currentDepth = [9999, 9999, 9999]
currentSum = 99999

File.foreach('01/input.csv').with_index do |depth, i|
  currentDepth[i % 3] = depth.to_i
  nbDepthIncreased += 1 if currentDepth.sum > currentSum
  currentSum = currentDepth.sum
end

puts "Part2=", nbDepthIncreased
