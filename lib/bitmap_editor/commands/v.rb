# frozen_string_literal: true

require_relative './base_command'

class BitmapEditor
  module Commands
    # Colors vertical line with a color
    class V < BaseCommand
      def initialize(x:, y1:, y2:, color:)
        @x = x - 1
        @y1 = y1 - 1
        @y2 = y2 - 1
        @color = color
      end

      def run(bitmap)
        (@y1..@y2).each { |y| bitmap[@x, y] = @color }
        bitmap
      end
    end
  end
end
