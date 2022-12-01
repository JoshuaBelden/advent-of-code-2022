# get all calories from input
input = File.readlines("input", chomp: true).map(&:to_i)

# create an array of sums based on empty lines
calories = []
idx = 0
input.each {|line|
  idx += 1 if line == 0
  calories[idx] = (calories[idx] ||= 0) + line
}

# Part 1 Solution: 69310
print "Solution 1: "
puts calories.max

# Part 2 Solution: 206104
top_calories = calories.sort.reverse.slice(0, 3)
print "Solution 2: "
puts top_calories.sum