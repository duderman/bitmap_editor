require './lib/bitmap_editor/params/base_param'

class BitmapEditor
  module Params
    class I < BaseParam
      MAX_FIELD_SIZE = 250

      argument :width, :integer, 1
      argument :height, :integer, 0

      validates :width, :height, presence: true, numericality: {
        greater_than: 0, less_than_or_equal_to: MAX_FIELD_SIZE,
        only_integer: true
      }
    end
  end
end
