# frozen_string_literal: true

require_relative './base_param'

class BitmapEditor
  module Params
    class I < BaseParam
      MAX_FIELD_SIZE = 250

      argument :width, :integer
      argument :height, :integer

      validates :width, :height, presence: true, coordinate: true

      def max_size
        MAX_FIELD_SIZE
      end
    end
  end
end
