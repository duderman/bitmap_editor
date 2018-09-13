# frozen_string_literal: true

require_relative './command_to_class_support'
require_relative './errors'
Dir['./lib/bitmap_editor/params/*.rb'].each { |file| require file }

class BitmapEditor
  module Params
    include CommandToClassSupport
  end
end
