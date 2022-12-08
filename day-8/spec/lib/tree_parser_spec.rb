require_relative '../../lib/tree_parser'

RSpec.describe TreeParser do
  describe '.new' do
    context 'with input' do
      it 'creates a new instance' do
        input = File.open("#{RSPEC_ROOT}/fixtures/input.txt").read.split("\n")
        parser = TreeParser.new(input)
        expect(parser).to be_a(TreeParser)
      end
    end
  end

  describe 'is_visible' do
    context 'with direction' do
      it 'determines visibility' do
        input = File.open("#{RSPEC_ROOT}/fixtures/input.txt").read.split("\n")
        parser = TreeParser.new(input)

        target_tree = [2, 2]
        target_tree_height = parser.get_tree_height(target_tree)
        expect(target_tree_height).to eq(3)

        trees_to_north = parser.get_trees_north_of(target_tree)
        expect(trees_to_north).to eq([5,3])

        trees_to_east = parser.get_trees_east_of(target_tree)
        expect(trees_to_east).to eq([3,2])

        trees_to_south = parser.get_trees_south_of(target_tree)
        expect(trees_to_south).to eq([5,3])

        trees_to_west = parser.get_trees_west_of(target_tree)
        expect(trees_to_west).to eq([5,6])

        max_tree_height_north = parser.get_max_tree_height_north_of(target_tree)
        expect(max_tree_height_north).to eq(5)

        max_tree_height_east = parser.get_max_tree_height_east_of(target_tree)
        expect(max_tree_height_east).to eq(3)

        max_tree_height_south = parser.get_max_tree_height_south_of(target_tree)
        expect(max_tree_height_south).to eq(5)

        max_tree_height_west = parser.get_max_tree_height_west_of(target_tree)
        expect(max_tree_height_west).to eq(6)

        visible_from_north = parser.get_tree_visible_from_north(target_tree)
        expect(visible_from_north).to eq(false)

        visible_from_east = parser.get_tree_visible_from_east(target_tree)
        expect(visible_from_north).to eq(false)

        visible_from_south = parser.get_tree_visible_from_south(target_tree)
        expect(visible_from_south).to eq(false)

        visible_from_west = parser.get_tree_visible_from_west(target_tree)
        expect(visible_from_west).to eq(false)

        is_visible = parser.get_tree_is_visible(target_tree)
        expect(is_visible).to eq(false)

        total_visible_trees = parser.get_total_visible_trees
        expect(total_visible_trees).to eq(21)
      end
    end
  end
end