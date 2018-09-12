# frozen_string_literal: true

require './lib/bitmap_editor/params/base_param'

class BitmapEditor
  module Params
    class I < BaseParam
      MAX_FIELD_SIZE = 250

      argument :height, :integer
      argument :width, :integer

      validates :width, :height, presence: true, coordinate: true

      def max_size
        MAX_FIELD_SIZE
      end
    end
  end
end
