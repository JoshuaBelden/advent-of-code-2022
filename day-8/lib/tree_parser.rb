class TreeParser
  attr_reader :input

  def initialize(input)
    @input = input
  end

  def get_tree_height(target)
    @input[target[1]][target[0]].to_i
  end

  def get_trees_north_of(target)
    x_coord = target[0]
    y_coord = target[1]

    (y_coord - 1).downto(0).map{|y|
      @input[y][x_coord].to_i
    }
  end

  def get_trees_south_of(target)
    x_coord = target[0]
    y_coord = target[1]

    ((y_coord + 1)..(@input.length-1)).map{|y|
      @input[y][x_coord].to_i
    }
  end

  def get_trees_west_of(target)
    x_coord = target[0]
    y_coord = target[1]

    (x_coord - 1).downto(0).map{|x|
      @input[y_coord][x].to_i
    }
  end

  def get_trees_east_of(target)
    x_coord = target[0]
    y_coord = target[1]

    ((x_coord + 1)..(@input[y_coord].length-1)).map{|x|
      @input[y_coord][x].to_i
    }
  end

  def get_max_tree_height_north_of(target)
    get_trees_north_of(target).max
  end

  def get_max_tree_height_south_of(target)
    get_trees_south_of(target).max
  end

  def get_max_tree_height_east_of(target)
    get_trees_east_of(target).max
  end

  def get_max_tree_height_west_of(target)
    get_trees_west_of(target).max
  end

  def get_tree_visible_from_north(target)
    get_tree_height(target) > get_max_tree_height_north_of(target)
  end

  def get_tree_visible_from_east(target)
    get_tree_height(target) > get_max_tree_height_east_of(target)
  end

  def get_tree_visible_from_south(target)
    get_tree_height(target) > get_max_tree_height_south_of(target)
  end

  def get_tree_visible_from_west(target)
    get_tree_height(target) > get_max_tree_height_west_of(target)
  end

  def get_tree_is_visible(target)
    get_tree_visible_from_north(target) ||
    get_tree_visible_from_east(target) ||
    get_tree_visible_from_south(target) ||
    get_tree_visible_from_west(target)
  end

  def get_total_visible_trees
    number_of_perimmiter_trees = (@input.length * 2) + (@input[0].length * 2) - 4
    visible_interior_trees = 0

    (1..@input.length-2).map{|y|
      (1..@input[y].length-2).map{|x|
        visible_interior_trees += 1 if get_tree_is_visible([x, y])
      }
    }

    number_of_perimmiter_trees + visible_interior_trees
  end
end