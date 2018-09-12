# frozen_string_literal: true

require './lib/bitmap_editor/interpreter'
require './lib/bitmap_editor/bitmap'

class BitmapEditor
  def self.run(file)
    new(file).run
  end

  def initialize(file)
    @file = file
  end

  def run
    return puts 'Please provide correct file' if missing_file?

    each_line do |bitmap, (line, idx)|
      process_line(line, idx, bitmap) || break
    end
  end

  private

  def each_line(&block)
    File.open(@file).each.with_index.reduce(BitmapEditor::Bitmap.new, &block)
  end

  def missing_file?
    @file.nil? || !File.exist?(@file)
  end

  def process_line(line, idx, bitmap)
    BitmapEditor::Interpreter.interpret(bitmap, line)
  rescue StandardError => error
    puts "Error on line #{idx + 1}. #{error.message}"
  end
end
