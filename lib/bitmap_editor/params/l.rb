# frozen_string_literal: true

require_relative './base_param'

class BitmapEditor
  module Params
    class L < BaseParam
      argument :x, :integer
      argument :y, :integer
      argument :color, :string

      validates :x, presence: true, coordinate: { axis: :x }
      validates :y, presence: true, coordinate: { axis: :y }
      validates :color, presence: true, color: true
    end
  end
end
