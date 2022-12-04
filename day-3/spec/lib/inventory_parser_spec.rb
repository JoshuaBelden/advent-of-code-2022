require_relative '../../lib/inventory_parser.rb'

RSpec.describe InventoryParser do
  describe '.new' do
    context 'with an inventory file' do
      it 'creates a new instance of the InventoryParser' do
        inventory = File.open("#{RSPEC_ROOT}/fixtures/inventory.txt").read.split("\n")
        parser = InventoryParser.new(inventory)
        expect(parser).to be_an(InventoryParser)
      end
    end
  end

  describe 'split_rucksack' do
    inventory = File.open("#{RSPEC_ROOT}/fixtures/inventory.txt").read.split("\n")
    parser = InventoryParser.new(inventory)
    
    it 'creates 2 inventories' do
      inventories = parser.split_rucksack("abc123")
      expect(inventories.length).to equal(2)
      expect(inventories[0]).to eq("abc")
      expect(inventories[1]).to eq("123")
    end
  end

  describe 'find_duplicate_type' do
    inventory = File.open("#{RSPEC_ROOT}/fixtures/inventory.txt").read.split("\n")
    parser = InventoryParser.new(inventory)
    
    it 'finds duplicate inventory item types' do
      duplicate_item = parser.find_duplicate_type("abc".chars, "12c".chars)
      expect(duplicate_item).to eq("c")
    end
  end

  # describe 'score_items' do
  #   inventory = File.open("#{RSPEC_ROOT}/fixtures/inventory.txt").read.split("\n")
  #   parser = InventoryParser.new(inventory)
    
  #   it 'scores duplicate items in a string' do
  #     score = parser.score_items("Q", "abcDzD".chars)
  #     expect(score).to eq(0)
  #     score = parser.score_items("c", "abcDzD".chars)
  #     expect(score).to eq(3)
  #     score = parser.score_items("D", "abcDzD".chars)
  #     expect(score).to eq(60)
  #   end
  # end

  describe 'parse' do
    inventory = File.open("#{RSPEC_ROOT}/fixtures/inventory.txt").read.split("\n")
    parser = InventoryParser.new(inventory)
    
    it 'calculates total' do
      parser.parse()
      expect(parser.score_sum).to eq(157)
    end
  end
end