require_relative '../../lib/play_strategy'
require_relative '../../lib/ro_sham_bo'

RSpec.describe RoShamBo do
  describe '.new' do
    context 'with a play_strategy' do
      it 'creates a new instance of play_strategy' do
        strategy_guide = File.open("#{RSPEC_ROOT}/fixtures/strategy_guide.txt").read.split("\n")
        play_strategy = PlayStrategy.new(strategy_guide)
        game = RoShamBo.new(play_strategy)
        expect(game).to be_a(RoShamBo)
      end
    end
  end

  describe 'playing' do
    context 'with a play_strategy' do
      strategy_guide = File.open("#{RSPEC_ROOT}/fixtures/strategy_guide.txt").read.split("\n")
      play_strategy = PlayStrategy.new(strategy_guide)
      game = RoShamBo.new(play_strategy)

      it 'scores total' do
        game.play()
        expect(game.total_score).to be(45)
      end
    end
  end
end