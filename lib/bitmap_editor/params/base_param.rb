require 'active_model'
require './lib/bitmap_editor/errors'
require_relative './arguments_support'

class BitmapEditor
  module Params
    class BaseParam
      include ActiveModel::Validations
      include BitmapEditor::Params::ArgumentsSupport

      attr_reader :bitmap
      delegate :width, :height, to: :bitmap, prefix: true

      def initialize(raw_params, bitmap = nil)
        @raw_params = raw_params
        @bitmap = bitmap
      end

      def validate!
        raise_invalid_error if invalid?
        to_args
      end

      private

      def raise_invalid_error
        full_errors = errors.full_messages.join(', ')
        message = "Invalid params '#{@raw_params.join(' ')}': #{full_errors}"
        raise BitmapEditor::InvalidParams, message
      end
    end
  end
end
