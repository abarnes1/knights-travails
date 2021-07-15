module PositionHelpers
  def inbounds?(location)
    return nil unless location.instance_of?(String) # can't identify the location

    return false unless ('a'..'h').include?(location[0].downcase) && (1..8).include?(location[1..-1].to_i)

    true
  end

  # 'b2' => [98, 2]
  def algebraic_to_int(location)
    [location[0].ord, location[1].to_i]
  end

  # 'a8' => 0, 'h1' => 63 (index is top to bottom, left to right)
  def algebraic_to_index(location)
    index_from_row = location[0].ord - 97
    index_from_col = (8 - location[1..-1].to_i) * 8

    index_from_row + index_from_col
  end

  # [98, 2] => 'b2'
  def int_to_algebraic(x_val, y_val)
    "#{x_val.chr}#{y_val}"
  end
end