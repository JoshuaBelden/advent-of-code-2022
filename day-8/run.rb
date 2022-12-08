require_relative 'lib/tree_parser'

input = File.open(File.expand_path('data/input.txt', File.dirname(__FILE__))).read.split("\n")
parser = TreeParser.new(input)
total_visible_trees = parser.get_total_visible_trees

print "Solution: "
puts total_visible_trees