require_relative 'lib/file_system'
require_relative 'lib/command_parser'

input = File.open(File.expand_path('data/input-small.txt', File.dirname(__FILE__))).read.split("\n")

fs = FileSystem.new
parser = CommandParser.new

input.each {|command|
  parser.exec(command, fs)
}

matches = []
fs.root.dirs_at_most(100000, matches)

sum = matches.sum{|m| m[1]}

print "Solution Part 1: "
puts sum

FIXNUM_MAX = (2**(0.size * 8 -2) -1)
matches = []
fs.root.dirs_at_most(FIXNUM_MAX, matches)
disk_space = 70000000
required_unused_space = 30000000

current_used_space = fs.root.size
current_un_used_space = disk_space - current_used_space
space_to_delete = required_unused_space - current_un_used_space

possible_directories = []
matches.each{|m|
  possible_directories << m[1] if m[1] >= space_to_delete
}

smallest_dir = possible_directories.min()
print "Solution Part 2: "
puts smallest_dir
