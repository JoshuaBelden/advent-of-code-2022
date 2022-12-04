class InventoryParser
  def initialize(inventory)
    @inventory = inventory
    @item_priority = [0].concat(('a'..'z').to_a).concat(('A'..'Z').to_a)
    @score_sum = 0
  end

  def split_rucksack(items)
    first, second = items.chars.each_slice(items.length / 2).map(&:join)
    [first, second]
  end

  def find_duplicate_type(items1, items2)
    items1.each do |item1|
      items2.each do |item2|
        return item1 if item1 == item2
      end
    end
  end

  # def score_items(item_type, items)
  #   count = (items.select {|item| item == item_type}).length
  #   @item_priority.find_index(item_type) * count
  # end

  def parse
    @inventory.map { |rucksack|
      split_items = split_rucksack(rucksack)
      duplicate_item_type = find_duplicate_type(split_items[0].chars, split_items[1].chars)
      @score_sum += @item_priority.find_index(duplicate_item_type)

      #score1 = score_items(duplicate_item_type, split_items[0].chars)
      #score2 = score_items(duplicate_item_type, split_items[1].chars)
      #@score_sum += score1 + score2
    }
  end

  def score_sum
    @score_sum
  end
end