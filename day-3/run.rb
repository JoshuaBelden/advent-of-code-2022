require_relative 'lib/inventory_parser'

inventory_file_path = File.expand_path('data/inventory.txt', File.dirname(__FILE__))
inventory = File.open(inventory_file_path).read.split("\n")

parser = InventoryParser.new(inventory)
parser.parse

print "Total Part 1 score: "
puts parser.score_sum