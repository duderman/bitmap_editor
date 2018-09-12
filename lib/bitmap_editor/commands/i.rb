# frozen_string_literal: true

require './lib/bitmap_editor/commands/base_command'

class BitmapEditor
  module Commands
    # Initializes bitmap with default color
    class I < BaseCommand
      def initialize(width:, height:)
        @width = width
        @height = height
      end

      def run(bitmap)
        bitmap.class.new(@width, @height)
      end
    end
  end
end
