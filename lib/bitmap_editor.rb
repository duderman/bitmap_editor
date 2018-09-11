require './lib/bitmap_editor/interpreter'
require './lib/bitmap_editor/bitmap'

class BitmapEditor
  def run(file)
    return puts "please provide correct file" if file.nil? || !File.exists?(file)

    File.open(file).each_with_index.with_object(BitmapEditor::Bitmap.new) do |(line, idx), bitmap|
      begin
        BitmapEditor::Interpreter.new(bitmap, line)
      rescue => error
        puts "Error on line #[idx}:"
        raise error
      end
    end
  end
end
