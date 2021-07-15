# frozen_string_literal: true

require_relative 'chess/position_helpers'

$stdout.sync = true # allows use of print keep prompt and input on same line

class PlayerInput
  extend PositionHelpers

  def self.start_square
    print 'Enter a valid (a8, b3, f5, etc...) starting square: '

    input_square
  end

  def self.end_square
    print 'Enter a valid (a8, b3, f5, etc...) ending square: '

    input_square
  end

  def self.valid?(input)
    return false if input.nil?

    return false unless input.instance_of?(String) && input.length == 2

    return false unless inbounds?(input)

    true
  end

  def self.input_square
    input = nil

    until valid?(input) && inbounds?(input)
      input = gets.chomp&.downcase
      print 'Invalid.. try again: ' unless valid?(input)
    end

    input
  end
end
