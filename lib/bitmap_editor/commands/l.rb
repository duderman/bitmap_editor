# frozen_string_literal: true

require './lib/bitmap_editor/commands/base_command'

class BitmapEditor
  module Commands
    # Colors one pixel with a color
    class L < BaseCommand
      def initialize(x:, y:, color:)
        @x = x - 1
        @y = y - 1
        @color = color
      end

      def run(bitmap)
        bitmap[@x, @y] = @color
        bitmap
      end
    end
  end
end
