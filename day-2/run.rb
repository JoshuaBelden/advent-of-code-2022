require_relative 'lib/play_strategy'
require_relative 'lib/goal_strategy'
require_relative 'lib/ro_sham_bo'

input_file_path = File.expand_path('data/strategy_guide.txt', File.dirname(__FILE__))
strategy_guide = File.open(input_file_path).read.split("\n")

strategy = PlayStrategy.new(strategy_guide)
game = RoShamBo.new(strategy)
game.play

print "Total play score: "
puts game.total_score

strategy = GoalStrategy.new(strategy_guide)
game = RoShamBo.new(strategy)
game.play

print "Total goal score: "
puts game.total_score