# frozen_string_literal: true

require_relative 'colors'
require_relative 'pieces/pieces'

class ChessSquare
  attr_accessor :color, :bg_color, :blink, :bg_highlight
  attr_reader :piece

  def initialize(values = {})
    @bg_color = values.key?(:bg_color) ? values[:bg_color] : nil
    @bg_highlight = values.key?(:bg_highlight) ? values[:bg_highlight] : nil
    @piece = values.key?(:piece) ? "#{values[:piece]} " : '  '
    @color = values.key?(:color) ? values[:color] : nil
    @blink = values.key?(:blink) ? values[:blink] : false
  end

  def piece=(piece)
    @piece = piece.nil? ? '  ' : "#{piece} "
  end

  def to_s
    output = @piece

    output = "\e[#{@bg_color}m#{@piece}\e[0m" if @bg_color # background color
    output = "\e[#{@bg_highlight}m#{@piece}\e[0m" if @bg_highlight # highlight color
    output = "\e[#{@color}m#{output}\e[0m" if @color # font color
    output = "\e[5m#{output}\e[25m" if @blink

    output
  end
end
