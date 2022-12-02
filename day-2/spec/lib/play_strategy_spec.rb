require_relative '../../lib/play_strategy'

RSpec.describe PlayStrategy do
  describe '.new' do
    context 'with a play_strategy guide' do
      it 'creates a new instance of play_strategy' do
        strategy_guide = File.open("#{RSPEC_ROOT}/fixtures/strategy_guide.txt").read.split("\n")
        play_strategy = PlayStrategy.new(strategy_guide)
        expect(play_strategy).to be_a(PlayStrategy)
      end
    end
  end

  describe 'shapes' do
    context 'with a play_strategy guide' do
      strategy_guide = File.open("#{RSPEC_ROOT}/fixtures/strategy_guide.txt").read.split("\n")
      play_strategy = PlayStrategy.new(strategy_guide)

      it 'is rock' do
        expect(play_strategy.map_shape('A')).to be(:rock)
        expect(play_strategy.map_shape('X')).to be(:rock)
      end

      it 'is paper' do
        expect(play_strategy.map_shape('B')).to be(:paper)
        expect(play_strategy.map_shape('Y')).to be(:paper)
      end

      it 'is scissor' do
        expect(play_strategy.map_shape('C')).to be(:scissor)
        expect(play_strategy.map_shape('Z')).to be(:scissor)
      end
    end
  end

  describe 'combat' do
    context 'with a play_strategy guide' do
      strategy_guide = File.open("#{RSPEC_ROOT}/fixtures/strategy_guide.txt").read.split("\n")
      play_strategy = PlayStrategy.new(strategy_guide)

      it 'rock beats scissor' do
        expect(play_strategy.combat(:rock, :scissor)).to be(:win)
      end

      it 'scissor beats paper' do
        expect(play_strategy.combat(:scissor, :paper)).to be(:win)
      end

      it 'paper beats rock' do
        expect(play_strategy.combat(:paper, :rock)).to be(:win)
      end

      it 'same choice is a draw' do
        expect(play_strategy.combat(:rock, :rock)).to be(:draw)
        expect(play_strategy.combat(:paper, :paper)).to be(:draw)
        expect(play_strategy.combat(:scissor, :scissor)).to be(:draw)
      end
    end
  end

  describe 'rounds' do
    context 'with a play_strategy guide' do
      strategy_guide = File.open("#{RSPEC_ROOT}/fixtures/strategy_guide.txt").read.split("\n")
      play_strategy = PlayStrategy.new(strategy_guide)

      it 'has correct count' do
        expect(play_strategy.rounds.length).to be(9)
      end
    end
  end

  describe 'shapes' do
    context 'with a play_strategy guide' do
      strategy_guide = File.open("#{RSPEC_ROOT}/fixtures/strategy_guide.txt").read.split("\n")
      play_strategy = PlayStrategy.new(strategy_guide)

      it 'rock scores 1' do
        expect(play_strategy.score_shape(:rock)).to be(1)
      end

      it 'paper scores 2' do
        expect(play_strategy.score_shape(:paper)).to be(2)
      end

      it 'scissor scores 3' do
        expect(play_strategy.score_shape(:scissor)).to be(3)
      end
    end
  end

  describe 'combat results' do
    context 'with a play_strategy guide' do
      strategy_guide = File.open("#{RSPEC_ROOT}/fixtures/strategy_guide.txt").read.split("\n")
      play_strategy = PlayStrategy.new(strategy_guide)

      it 'win scores 6' do
        expect(play_strategy.score_combat(:win)).to be(6)
      end

      it 'draw scores 3' do
        expect(play_strategy.score_combat(:draw)).to be(3)
      end

      it 'lose scores 0' do
        expect(play_strategy.score_combat(:lose)).to be(0)
      end
    end
  end
end