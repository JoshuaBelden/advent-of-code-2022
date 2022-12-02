class Strategy
  def initialize(strategy_guide)
    @rounds = []
    @strategy_guide = strategy_guide.map { |line|
      shapes = line.split(" ")
      round = Struct.new(:player, :oponent).new
      map_round!(shapes, round)
      @rounds << round
    }
  end

  def map_shape(shape)
    case shape
      when "A","X"
        :rock
      when "B","Y"
        :paper
      when "C","Z"
        :scissor
    end
  end

  def combat(player, oponent)
    case player
    when :rock
      return :win if oponent == :scissor
      return :lose if oponent == :paper
      :draw
    when :paper
      return :win if oponent == :rock
      return :lose if oponent == :scissor
      :draw
    when :scissor
      return :win if oponent == :paper
      return :lose if oponent == :rock
      :draw
    end
  end

  def score_shape(shape)
    case shape
    when :rock
      1
    when :paper
      2
    when :scissor
      3
    end
  end

  def score_combat(result)
    case result
    when :win
      6
    when :draw
      3
    when :lose
      0
    end
  end

  def rounds
    @rounds
  end
end