require_relative '../../lib/goal_strategy'

RSpec.describe GoalStrategy do
  describe '.new' do
    context 'with a goal strategy guide' do
      it 'creates a new instance of goal_strategy' do
        strategy_guide = File.open("#{RSPEC_ROOT}/fixtures/strategy_guide.txt").read.split("\n")
        goal_strategy = GoalStrategy.new(strategy_guide)
        expect(goal_strategy).to be_a(GoalStrategy)
      end
    end
  end

  describe 'goal' do
    context 'with a goal strategy guide' do
      strategy_guide = File.open("#{RSPEC_ROOT}/fixtures/strategy_guide.txt").read.split("\n")
      goal_strategy = GoalStrategy.new(strategy_guide)

      it 'is to lose' do
        expect(goal_strategy.map_goal('X', :rock)).to be(:scissor)
        expect(goal_strategy.map_goal('X', :paper)).to be(:rock)
        expect(goal_strategy.map_goal('X', :scissor)).to be(:paper)
      end

      it 'is to draw' do
        expect(goal_strategy.map_goal('Y', :rock)).to be(:rock)
        expect(goal_strategy.map_goal('Y', :paper)).to be(:paper)
        expect(goal_strategy.map_goal('Y', :scissor)).to be(:scissor)
      end

      it 'is to win' do
        expect(goal_strategy.map_goal('Z', :rock)).to be(:paper)
        expect(goal_strategy.map_goal('Z', :paper)).to be(:scissor)
        expect(goal_strategy.map_goal('Z', :scissor)).to be(:rock)
      end
    end
  end
end