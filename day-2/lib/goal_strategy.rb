require_relative "strategy"

##
# The GoalStrategy uses the second column of the strategy guide
# as an indicator of whether they should win, lose, or draw.
class GoalStrategy < Strategy
  def map_round!(shapes, round)
    opponent_shape = map_shape(shapes[0])
    round.oponent = opponent_shape
    round.player = map_goal(shapes[1], opponent_shape)
  end

  def map_goal(goal, opponent)
    case goal
      when "X" # :lose
        lose_against(opponent)
      when "Y" # :draw
        draw_against(opponent)
      when "Z" # :win
        win_against(opponent)
    end
  end

  def win_against(shape)
    case shape
    when :rock
      :paper
    when :paper
      :scissor
    when :scissor
      :rock
    end
  end

  def draw_against(shape)
    shape
  end

  def lose_against(shape)
    case shape
    when :rock
      :scissor
    when :paper
      :rock
    when :scissor
      :paper
    end
  end
end