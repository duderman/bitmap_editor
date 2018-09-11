require './lib/bitmap_editor/commands'
require './lib/bitmap_editor/params'

class BitmapEditor::Interpreter
  def initialize(bitmap, raw_line)
    @bitmap = bitmap
    @raw_line = raw_line
  end

  def run
    @bitmap.apply(command)
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
    @line ||= BitmapEditor::Line.parse(@raw_line)
  end
end
