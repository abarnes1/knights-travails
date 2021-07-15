# frozen_string_literal: true

require_relative 'chess/position_helpers'

class TravailNode
  include PositionHelpers

  attr_reader :position, :parent_node

  def initialize(position, parent_node = nil)
    @position = position
    @parent_node = parent_node
  end

  def moves
    moves = []
    moves << position

    parent = parent_node

    until parent.nil?
      moves << parent.position
      parent = parent.parent_node
    end

    moves.reverse
  end
end