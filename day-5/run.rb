class Command
  def initialize(count, from, to)
    @count = count
    @from = from
    @to = to
  end

  def count
    @count
  end

  def from
    @from
  end

  def to
    @to
  end
end

class Stack
  def initialize
    @store = []
  end

  def push(item)
    @store << item if item != nil
  end

  def pop
    @store.pop
  end

  def head
    @store[@store.length-1] || '_'
  end
end

class Container
  def initialize(crates)
    @stacks = Array.new(9)
    @stacks.map! {|stack| Stack.new }

    for stack_idx in 0..8
      for crate_idx in 7.downto(0)
        @stacks[stack_idx].push(crates[crate_idx][stack_idx]) if !crates[crate_idx][stack_idx].empty?
      end
    end
  end

  def issue(command)
    for x in 1..command.count
      @stacks[command.to].push(@stacks[command.from].pop)
    end
  end

  def stacks
    @stacks
  end
end

class Parser
  def initialize(input)
    @input = input
  end

  def parse
    crates = []
    commands = []
    @input.map {|line|
      if line.match(/\[.\]/)
        crates << parse_crate(line)
      end

      if line.match(/move/)
        commands << parse_command(line)
      end
    }

    container = Container.new(crates)

    return container, commands
  end

  def parse_crate(line)
    crate = line.scan(/.{4}/)
    crate.map! {|c|
      c = c.gsub("[", "").gsub("]", "").strip!
    }
    crate
  end

  def parse_command(line)
    match = /move (?<count>\d) from (?<from>\d) to (?<to>\d)/ =~ line
    Command.new(count.to_i, from.to_i-1, to.to_i-1)
  end
end

input = File.open(File.expand_path('data/input.txt', File.dirname(__FILE__))).read.split("\n")

parser = Parser.new(input)
container, commands = parser.parse

commands.each {|command| 
  container.issue(command)
}

container.stacks.each {|stack|
  puts stack.head
}