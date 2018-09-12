require './lib/bitmap_editor/commands/base_command'

class BitmapEditor
  module Commands
    # Colors horizontal line with a color
    class H < BaseCommand
      def initialize(y:, x1:, x2:, color:)
        @y = y - 1
        @x1 = x1 - 1
        @x2 = x2 - 1
        @color = color
      end

      def run(bitmap)
        (@x1..@x2).each { |x| bitmap[x, @y] = @color }
        bitmap
      end
    end
  end
end
