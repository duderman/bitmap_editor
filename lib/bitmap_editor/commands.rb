# frozen_string_literal: true

require './lib/bitmap_editor/command_to_class_support'
Dir['./lib/bitmap_editor/commands/*.rb'].each { |file| require file }

class BitmapEditor
  module Commands
    include CommandToClassSupport
  end
end
