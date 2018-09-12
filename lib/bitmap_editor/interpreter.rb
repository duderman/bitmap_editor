# frozen_string_literal: true

require './lib/bitmap_editor/commands'
require './lib/bitmap_editor/params'
require_relative './line'

class BitmapEditor
  class Interpreter
    def self.interpret(bitmap, raw_line)
      new(bitmap, raw_line).run
    end

    def initialize(bitmap, raw_line)
      @bitmap = bitmap
      @raw_line = raw_line
    end

    def run
      return @bitmap unless line.present?

      command.run(@bitmap)
    end

    def command
      command_class.new(arguments)
    end

    def arguments
      params_class.new(line.params, @bitmap).validate!
    end

    def command_class
      BitmapEditor::Commands.for_command(line.command)
    end

    def params_class
      BitmapEditor::Params.for_command(line.command)
    end

    def line
      return unless @raw_line.to_s.chomp

      @line ||= BitmapEditor::Line.new(@raw_line)
    end
  end
end
