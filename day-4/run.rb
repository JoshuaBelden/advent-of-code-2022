#require_relative 'lib/inventory_parser'

section_assignments = File.open(File.expand_path('data/section_assignments.txt', File.dirname(__FILE__))).read.split("\n")
count = 0
section_assignments.each {|pair|
  assignments = pair.split(",")

  assignment1 = assignments[0].split("-")
  range1 = (assignment1[0].to_i .. assignment1[1].to_i)
  
  assignment2 = assignments[1].split("-")
  range2 = (assignment2[0].to_i .. assignment2[1].to_i)

  # if range1.min <= range2.min && range1.max >= range2.max ||
  #   range2.min <= range1.min && range2.max >= range1.max
  #   count += 1
  # end

  if range1.cover?(range2.first) || range2.cover?(range1.first)
    count += 1
  end
}

puts count