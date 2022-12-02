
class RoShamBo
  def initialize(strategy)
    @strategy = strategy
    @total_score = 0
  end

  def play()
    @strategy.rounds.each do |round|
      result = @strategy.combat(round.player, round.oponent)

      shape_score = @strategy.score_shape(round.player)
      combat_score = @strategy.score_combat(result)

      @total_score +=  shape_score + combat_score
    end
  end

  def total_score
    @total_score
  end
end