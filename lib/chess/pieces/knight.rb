# frozen_string_literal: true

require_relative '../position_helpers'

class Knight
  include PositionHelpers

  def initialize(position)
    @position = position
  end

  def possible_moves
    position_changes = generate_xy_changes if @possible_moves.nil?

    position_changes.each_with_object([]) do |change, valid_moves|
      new_x = @position[0].ord + change[0]
      new_y = @position[1].to_i + change[1]
      new_position = int_to_algebraic(new_x, new_y)

      valid_moves.push(new_position) if inbounds?(new_position)
    end
  end

  def place(coord)
    @position = coord
  end

  private

  def generate_xy_changes
    direction_one = [-2, 2]
    direction_two = [-1, 1]

    if @position_changes.nil?
      @position_changes = direction_one.product(direction_two) + direction_two.product(direction_one)
    end

    @position_changes
  end
end
