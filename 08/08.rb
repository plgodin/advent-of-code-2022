input = File.readlines('08/input.txt').map(&:chomp)

forest = input.map do |line|
  line.chars.map(&:to_i)
end

forest_t = forest.transpose

# Return an array of booleans representing whether each value in the array is larger than all previous values
def find_visible(trees)
  trees.each_with_index.map do |tree, i|
    trees[0...i].all? { |t| t < tree }
  end
end

# From the left
visible_forest = forest.map { |row| find_visible(row) }

# From the right
visible_forest.map!.with_index do |row, i|
  find_visible(forest[i].reverse).reverse.zip(row).map { |a, b| a || b }
end

# From the top
visible_forest = visible_forest.transpose.map!.with_index do |col, i|
  find_visible(forest_t[i]).zip(col).map { |a, b| a || b }
end.transpose

# From the bottom
visible_forest = visible_forest.transpose.map!.with_index do |col, i|
  find_visible(forest_t[i].reverse).reverse.zip(col).map { |a, b| a || b }
end.transpose

# Count the number of visible trees
puts "Part 1:",visible_forest.flatten.count(true)

def scenic_score(forest, i, j)
  # Find the number of trees with height < tree in each direction
  left = forest[i][0...j].reverse.take_while { |t| t < forest[i][j] }.count
  left += 1 if j - left > 0
  right = forest[i][j+1..-1].take_while { |t| t < forest[i][j] }.count
  right += 1 if j + right < forest[i].length - 1
  top = forest.transpose[j][0...i].reverse.take_while { |t| t < forest[i][j] }.count
  top += 1 if i - top > 0
  bottom = forest.transpose[j][i+1..-1].take_while { |t| t < forest[i][j] }.count
  bottom += 1 if i + bottom < forest.length - 1
  left * right * top * bottom
end

scenic_scores = forest.each_with_index.map do |row, i|
  row.each_with_index.map { |tree, j| scenic_score(forest, i, j) }
end

puts "Part 2:", scenic_scores.flatten.max
