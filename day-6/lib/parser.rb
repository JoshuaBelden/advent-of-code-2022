class Parser
  def initialize(input)
    @input = input
  end

  def parse(marker_length)
    segment = ""
    @input.chars.each_with_index {|c, i|
      segment += c
      next if segment.length < marker_length

      if segment.length > marker_length
        segment = segment.slice(1, marker_length) 
      end
      return i+1 if is_unique(segment)
    }
  end

  def is_unique(value)
    match = value.scan(/[a-z]/i)
    match.length == match.uniq.length
  end
end