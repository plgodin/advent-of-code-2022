require 'set'

input = File.readlines('09/input.txt').map(&:chomp)

visited_locations = Set.new([[0, 0]])
xh = 0
yh = 0
xt = 0
yt = 0

def move_head(xh, yh, dir)
  case dir
  when 'U'
    yh -= 1
  when 'D'
    yh += 1
  when 'L'
    xh -= 1
  when 'R'
    xh += 1
  end
  [xh, yh]
end

def move_tail(xh, yh, xt, yt)
  if (xh - xt).abs > 1
    xt += xh <=> xt
    yt += yh <=> yt
  elsif (yh - yt).abs > 1
    yt += yh <=> yt
    xt += xh <=> xt
  end
  [xt, yt]
end

input.each do |line|
  /(\w) (\d+)/ =~ line
  $2.to_i.times do
    xh, yh = move_head(xh, yh, $1)
    xt, yt = move_tail(xh, yh, xt, yt)
    visited_locations << [xt, yt]
  end
end

puts "Part 1:", visited_locations.count

x = Array.new(10, 0)
y = Array.new(10, 0)
visited_locations.clear

input.each do |line|
  /(\w) (\d+)/ =~ line
  $2.to_i.times do
    x[0], y[0] = move_head(x[0], y[0], $1)
    9.times do |i|
      x[i+1], y[i+1] = move_tail(x[i], y[i], x[i+1], y[i+1])
    end
    visited_locations << [x[9], y[9]]
  end
end

puts "Part 2:", visited_locations.count
