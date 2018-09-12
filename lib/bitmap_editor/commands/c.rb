# frozen_string_literal: true

require './lib/bitmap_editor/commands/i'

class BitmapEditor
  module Commands
    # Resets bitmap with default color
    class C < BaseCommand
      def run(bitmap)
        BitmapEditor::Commands::I.new(width: bitmap.width, height: bitmap.height).run(bitmap)
      end
    end
  end
end
