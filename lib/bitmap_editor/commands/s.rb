# frozen_string_literal: true

require './lib/bitmap_editor/commands/base_command'

class BitmapEditor
  module Commands
    # Prints bitmap to out
    class S < BaseCommand
      EMPTY_IMAGE_MESSAGE = 'There is no image'

      def initialize(out: STDOUT)
        @out = out
      end

      def run(bitmap)
        message = bitmap.to_s.presence || EMPTY_IMAGE_MESSAGE
        @out << message << "\n"
        bitmap
      end
    end
  end
end
