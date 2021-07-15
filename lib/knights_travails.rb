# frozen_string_literal: true

require_relative 'chess/pieces/knight'
require_relative 'chess/position_helpers'
require_relative 'travail_node'

class KnightsTravails
  include PositionHelpers

  def initialize; end

  def knights_moves(starting_position, ending_position)
    @root = TravailNode.new(starting_position)
    @knight = Knight.new(starting_position)
    @final_position = ending_position
    @visited = []

    last_node = travail([@root])
    return nil if last_node.nil?

    last_node.moves
  end

  def travail(queue = [@root])
    # if out of queue items we can't find a path
    return nil if queue.length.zero?

    # base case is we are visiting the final position
    node = queue.shift

    return node if node.position == @final_position

    @visited << node.position
    @knight.place(node.position)
    new_node_positions = @knight.possible_moves

    new_node_positions.each do |position|
      queue.push(TravailNode.new(position, node)) unless @visited.include?(position) || !inbounds?(position)
    end

    travail(queue)
  end
end
