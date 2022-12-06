require_relative 'lib/parser'

input = File.open(File.expand_path('data/input.txt', File.dirname(__FILE__))).read
parser = Parser.new(input)

result = parser.parse(4)
print "Solution Part 1: "
puts result

result = parser.parse(14)
print "Solution Part 2: "
puts result
