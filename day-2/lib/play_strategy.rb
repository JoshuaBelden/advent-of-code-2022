require_relative "strategy"

##
# The PlayStrategy uses the second column of the strategy guide
# as an indicator of what shape the player should play
class PlayStrategy < Strategy
  def map_round!(shapes, round)
    round.oponent = map_shape(shapes[0])
    round.player = map_shape(shapes[1])
  end
end