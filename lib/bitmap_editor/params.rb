# frozen_string_literal: true

require './lib/bitmap_editor/command_to_class_support'
require './lib/bitmap_editor/errors'
Dir['./lib/bitmap_editor/params/*.rb'].each { |file| require file }

class BitmapEditor
  module Params
    include CommandToClassSupport
  end
end
