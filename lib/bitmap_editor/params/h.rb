# frozen_string_literal: true

require './lib/bitmap_editor/params/base_param'

class BitmapEditor
  module Params
    class H < BaseParam
      argument :x1, :integer
      argument :x2, :integer
      argument :y, :integer
      argument :color, :string

      validates :y, presence: true, coordinate: { axis: :y }
      validates :x1, :x2, presence: true, coordinate: { axis: :x }
      validates :color, presence: true, color: true
    end
  end
end
